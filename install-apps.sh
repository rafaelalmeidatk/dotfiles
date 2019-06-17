#!/bin/bash

echo 'Asking sudo permission...'
sudo true

echo 'Updating repo and installing packages...'
sudo apt-get update
sudo apt-get install -y \
    xclip \
    gconf2 \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Snaps
echo 'Installing snaps...'
sudo snap install code --classic
sudo snap install slack --classic
sudo snap install spotify
sudo snap install gitkraken
sudo snap install postman
sudo snap install gimp

# Downloads folder
rm -r downloads
mkdir downloads

# Hyper
if ! [ -x "$(command -v hyper)" ]; then
    echo 'Downloading Hyper...'
    curl -L https://releases.hyper.is/download/deb -o downloads/hyper.deb
    sudo apt-get install downloads/hyper.deb
fi

# Docker
if ! [ -x "$(command -v docker)" ]; then
    echo 'Installing Docker...'
    sh -c "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
    sh -c "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable\""
    sudo apt install -y docker-ce
fi

# Docker compose
if ! [ -x "$(command -v docker-compose)" ]; then
    echo 'Installing Docker Compose...'
    sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi