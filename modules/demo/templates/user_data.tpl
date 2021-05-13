#!/bin/bash

# Add docker repository
cd /tmp
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker Engine
sudo dnf install -y docker-ce docker-ce-cli containerd.io

# Start Docker Engine
sudo systemctl start docker

# Start nginx Docker image
docker run -it --rm -d -p 8080:80 --name web nginx
