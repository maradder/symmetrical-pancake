#!/bin/bash

# Remove any existing installations of Docker (You may need to use sudo)
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Run apt autoremove to clean up your packages
sudo apt autoremove

# Update your package lists
sudo apt-get update

# Install required packages for Docker installation
sudo apt-get install ca-certificates curl gnupg

# Create a directory for keyrings
sudo install -m 0755 -d /etc/apt/keyrings

# Download Docker's GPG key and save it to the keyrings directory
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set proper permissions for the GPG key
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker's repository to the package sources list
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# Update package lists to include Docker repository
sudo apt-get update

# Install Docker components
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
