#!/bin/bash

sudo apt-get update
# Set up folder structure
mkdir -p ~/syook/{configs/{insite-java-gateway,insite-python-wrapper,insite-server,insite-client,mosquitto/certs,mongo,mongo-backup,telegraf,redis,elk,cfbot},scripts/mongo,consul/{consul-templates,vault-templates},logs/{insite-java-gateway,insite-python-wrapper,insite-server,insite-client,mosquitto,mongo,mongo-backup,cfbot},dbs/{mosquitto,redis,mongo,manual_db_dumps,mongo-backup,insite-server/rawstreams},shared/rawstreams}

# Install Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install Docker
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# install docker auto-completion 
sudo curl \
    -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/bash/docker-compose \
    -o /etc/bash_completion.d/docker-compose

docker-compose --version

sudo usermod -aG docker ${USER}
sudo su - ${USER}

echo "Type exit"