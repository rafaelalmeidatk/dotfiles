#!/bin/bash

echo 'Asking sudo permission...'
sudo true

echo 'Updating repo and installing packages...'
sudo apt-get -qq update
sudo apt-get install -y \
    xclip \
    gconf2 \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gparted \
    python3-pip \
    build-essential \
    cmake

# Snaps
echo 'Installing snaps...'
sudo snap install code --classic
sudo snap install slack --classic
sudo snap install spotify
sudo snap install postman
sudo snap install gimp
sudo snap install vlc --channel=latest/stable

# Downloads folder
rm -r downloads && mkdir downloads

# Yarn
if ! [ -x "$(command -v yarn)" ]; then
    echo 'Installing Yarn...'
    sh -c "curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -"
    sh -c "echo \"deb https://dl.yarnpkg.com/debian/ stable main\" | sudo tee /etc/apt/sources.list.d/yarn.list"
    sudo apt-get update
    sudo apt-get install -y --no-install-recommends yarn
fi

# Hyper
if ! [ -x "$(command -v hyper)" ]; then
    echo 'Installing Hyper...'
    curl -L https://releases.hyper.is/download/deb -o downloads/hyper.deb
    sudo apt-get install downloads/hyper.deb
fi

# Docker
if ! [ -x "$(command -v docker)" ]; then
    echo 'Installing Docker...'
    sh -c "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
    sh -c "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable\""
    sudo apt-get install -y docker-ce
    echo 'Adding the user to the docker group...'
    sudo usermod -aG docker $USER
fi

# Docker compose
if ! [ -x "$(command -v docker-compose)" ]; then
    echo 'Installing Docker Compose...'
    sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

# Dotnet
if ! [ -x "$(command -v dotnet)" ]; then
    echo 'Installing Dotnet...'
    wget -P downloads -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb
    sudo dpkg -i downloads/packages-microsoft-prod.deb
    sudo apt-get -qq update
    sudo apt-get install -y dotnet-sdk-2.2
fi