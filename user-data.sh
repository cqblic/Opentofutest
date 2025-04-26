#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

echo "Hello, World!" > /var/tmp/hello.txt
sudo apt -y update
sudo apt install -y python3-pip
sudo apt install -y python3-venv
sudo apt install -y python3-dev
sudo apt install -y libssl-dev
sudo apt install -y libffi-dev
sudo apt install -y build-essential
sudo apt install -y libpq-dev
sudo apt install -y libjpeg-dev
#sudo apt install -y mongodb-org-shell
#sudo apt install -y mongodb-org
sudo apt install -y uvicorn
sudo apt install -y dotenv
sudo apt install -y python3-dotenv
sudo apt install -y python3-pydantic
sudo apt install -y python3-pymongo
sudo apt install -y python3-fastapi
sudo apt install -y python3-motor
sudo apt install -y python3-jose
sudo apt install -y certbot
sudo apt install -y nodejs 
sudo apt install -y npm

# git repo - cmmc python script 
su - azureuser
cd /home/azureuser
echo ${GITHUB_TOKEN}
git clone https://${GITHUB_TOKEN}@github.com/cqblic/cmmc-python.git
sudo chown -R azureuser:azureuser cmmc-python
cd cmmc-python

# create virtual env
python3 -m venv env
source env/bin/activate
echo 'MONGODB_URL="${MONGODB_URL}"' >> .env
echo 'CSV_FILE_PATH=D:\Documents\control_scores.csv' >> .env
echo 'AZURE_AUD=57add518-faef-422d-b2a7-459eebb9fe24' >> .env
echo 'AZURE_ISS=https://sacmmc.b2clogin.com/3b5b9af2-5ead-459f-afe8-deb4a07d7941/v2.0/' >> .env
echo 'AZURE_TENANT_ID=3b5b9af2-5ead-459f-afe8-deb4a07d7941' >> .env
echo 'AZURE_TENANT_NAME=sacmmc' >> .env
echo 'JWT_SECRET=${JWT_SECRET}' >> .env
echo 'USE_SECURE_COOKIES=True' >> .env
echo 'ENVIRONMENT=dev' >> .env

pip install --upgrade --force-reinstall -r requirements.txt
# run the app in background
nohup uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload &

# get cmmc frontend vue repo 
cd /home/azureuser
git clone https://${GITHUB_TOKEN}@github.com/cqblic/cmmc-frontend.git
sudo chown -R azureuser:azureuser cmmc-frontend
cd cmmc-frontend

# getssl
curl --silent https://raw.githubusercontent.com/srvrco/getssl/latest/getssl > getssl ; chmod 700 getssl
./getssl -c sa-cmmc.com -w ~/cmmc-frontend/certs

# instal npm app 
npm install
nohup npm run dev -- --host &
