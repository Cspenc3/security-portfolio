#!/bin/bash

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Disabling unused services..."
sudo systemctl stop apache2
sudo systemctl disable apache2

echo "Setting secure permissions..."
chmod 700 /home

echo "Hardening complete."