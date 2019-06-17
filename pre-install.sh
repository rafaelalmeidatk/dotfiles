#!/bin/bash

# Update repo
echo 'Updating repository'
sudo apt-get update

# Install ZSH and Git
echo 'Installing ZSH and Git'
sudo apt-get install zsh git

# Change default shell
echo 'Changing default shell to zsh'
sudo chsh -s $(which zsh) $USER