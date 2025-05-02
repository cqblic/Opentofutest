#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sudo apt -y update
sudo apt install -y python3-pip
sudo apt install -y python3-venv
sudo apt install -y python3-dev
sudo apt install -y libssl-dev
sudo apt install -y libffi-dev
sudo apt install -y build-essential
sudo apt install -y libpq-dev
sudo apt install -y libjpeg-dev
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

# cmmc python script 
su - azureuser
cd /home/azureuser
echo ${GITHUB_TOKEN}
git clone https://${GITHUB_TOKEN}@github.com/cqblic/cmmc-python.git
sudo chown -R azureuser:azureuser cmmc-python
cd cmmc-python

# setup cert for domain
mkdir certs
sudo chown -R azureuser:azureuser certs
sudo echo "${private_key}" > certs/privkey1.pem
sudo echo "${fullchain}" > certs/fullchain1.pem

# setup env variables 
cat <<EOF > .env 
MONGODB_URL=${MONGODB_URL}
AZURE_AUD=${AZURE_AUD}
AZURE_ISS=${AZURE_ISS}
AZURE_TENANT_ID=${AZURE_TENANT_ID}
AZURE_TENANT_NAME=${AZURE_TENANT_NAME}
JWT_SECRET=${JWT_SECRET}
USE_SECURE_COOKIES=True
ENVIRONMENT=dev
EOF


# create virtual env
python3 -m venv env
source env/bin/activate
pip install --upgrade --force-reinstall -r requirements.txt

# run the app in background
nohup uvicorn main:app --host 0.0.0.0 --ssl-keyfile=./certs/privkey1.pem --ssl-certfile=./certs/fullchain1.pem --reload &

# cmmc frontend vue 
cd /home/azureuser
git clone https://${GITHUB_TOKEN}@github.com/cqblic/cmmc-frontend.git
sudo chown -R azureuser:azureuser cmmc-frontend
cd cmmc-frontend
mkdir certs
# setup cert for domain 
openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out dev.crt \
            -keyout dev.key \
            -subj "/C=US/ST=CA/L=cqblic/O=Security/OU=IT /CN=sa-cmmc.com"

mv dev.crt certs/
mv dev.key certs/
sudo chown -R azureuser:azureuser certs
# run the app in background
npm install
nohup npm run dev -- --host &
