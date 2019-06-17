#!/bin/zsh

# Install nvm node version
source ~/.nvm/nvm.sh
nvm install v10.16.0

# Set Hyper as the default terminal of GNOME
gsettings set org.gnome.desktop.default-applications.terminal exec 'hyper'