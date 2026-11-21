#!/bin/bash
set -e

echo "Updating packages..."
sudo apt update && sudo apt upgrade -y

echo "Installing Nginx..."
sudo apt install nginx -y
sudo systemctl enable --now nginx

echo "Configuring firewall..."
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw --force enable

echo "Creating web directory..."
sudo mkdir -p /var/www/mysite
sudo chown -R $USER:$USER /var/www/mysite

echo "Applying Nginx config..."
sudo cp ../nginx/mysite.conf /etc/nginx/sites-available/mysite
sudo ln -sf /etc/nginx/sites-available/mysite /etc/nginx/sites-enabled/mysite
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t && sudo systemctl reload nginx

echo "Setup complete!"