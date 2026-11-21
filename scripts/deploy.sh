#!/bin/bash
set -e

SERVER_USER="ubuntu"
SERVER_HOST="YOUR_SERVER_IP"
KEY_PATH="$HOME/.ssh/mykey.pem"

rsync -avz --delete -e "ssh -i $KEY_PATH" \
  ../website/ $SERVER_USER@$SERVER_HOST:/var/www/mysite/

ssh -i $KEY_PATH $SERVER_USER@$SERVER_HOST "sudo systemctl reload nginx"
echo "Deployment finished!"