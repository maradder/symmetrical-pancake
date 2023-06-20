#!/bin/bash

# Update the system
sudo apt update && sudo apt dist-upgrade -y

# Ensure that you have the following packages installed
sudo apt install build-essential curl file git -y

# Install Zsh
sudo apt install zsh -y

# Check the Zsh version
zsh --version

# Install Oh My Zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" --unattended

# Install Powerline fonts
sudo apt install fonts-powerline -y

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
