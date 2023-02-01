### Simple test scripts (CSRF)
#### Step by step:
1. Let's start dvwa and basic-auth pages: `docker-compose up`

2. Now, you can access the following two URLs:
   - 127.0.0.1(:80) (dvwa auth)
   - :8000 (htaccess auth)
   
3. Open dvwa-app and configure it 
   - https://github.com/digininja/DVWA
   - https://hub.docker.com/r/vulnerables/web-dvwa/

4. Try these scripts below:

#### 3 simple example scripts:

1. Hydra: `sh hydra-auth-basic.sh` - htaccess auth
2. Patator: `sh patator-script.sh` - with csrf picking
3. Own python script: `python3 csrf-test.py` - with csrf picking

rockyou.txt:
https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt