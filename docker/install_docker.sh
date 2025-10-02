#!/bin/bash

set -e  # Exit on error

# Remove any existing installations of Docker
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do
    sudo apt-get remove -y $pkg 2>/dev/null || true
done

# Run apt autoremove to clean up packages
sudo apt-get autoremove -y

# Update package lists
sudo apt-get update

# Install required packages for Docker installation
sudo apt-get install -y ca-certificates curl gnupg

# Create directory for keyrings
sudo install -m 0755 -d /etc/apt/keyrings

# Download Docker's GPG key (remove old key first to ensure idempotency)
sudo rm -f /etc/apt/keyrings/docker.gpg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set proper permissions for the GPG key
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Remove old repository file to prevent duplicates
sudo rm -f /etc/apt/sources.list.d/docker.list

# Add Docker's repository to the package sources list
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# Update package lists to include Docker repository
sudo apt-get update

# Install Docker components
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Docker installation complete. Version:"
sudo docker --version
sudo docker compose version
