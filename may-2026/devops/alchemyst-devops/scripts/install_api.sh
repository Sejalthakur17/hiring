#!/bin/bash

echo "Updating packages.."
sudo apt update -y

echo "Installing Python and pip.."
sudo apt install python3-pip -y

echo "Installing Docker.."
sudo apt install docker.io -y

echo "Starting Docker.."
sudo systemctl start docker
sudo systemctl enable docker

echo "API setup completed."