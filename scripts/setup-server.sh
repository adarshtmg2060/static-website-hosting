
#!/bin/bash

set -e

# ==========================================
# AWS EC2 Static Website Deployment
# Ubuntu + Git + Nginx
# ==========================================

echo "======================================"
echo " Starting EC2 Server Setup"
echo "======================================"

# 1. Update and Upgrade Ubuntu Packages

echo "Updating and upgrading packages..."

sudo apt update
sudo apt upgrade -y


# 2. Install Git

echo "Installing Git..."

sudo apt install git -y

git --version


# 3. Install Nginx

echo "Installing Nginx..."

sudo apt install nginx -y


# 4. Start and Enable Nginx

echo "Starting and enabling Nginx..."

sudo systemctl enable --now nginx

echo "Nginx Status:"
sudo systemctl is-active nginx


# 5. Create Temporary Repository Directory

echo "Preparing repository directory..."

REPO_DIR="/tmp/static-website-hosting"
WEB_DIR="/var/www/mysite"

REPO_URL="https://github.com/adarshtmg2060/static-website-hosting.git"

sudo rm -rf "$REPO_DIR"

sudo mkdir -p "$WEB_DIR"


# 6. Clone Website from GitHub

echo "Cloning website repository..."

sudo git clone "$REPO_URL" "$REPO_DIR"


# 7. Copy Website Files to Nginx Web Directory

echo "Deploying website files..."

if [ ! -d "$REPO_DIR/website" ]; then
    echo "ERROR: website folder not found in GitHub repository!"
    exit 1
fi

# Copy only the contents of website folder
sudo cp -a "$REPO_DIR/website/." "$WEB_DIR/"


# 8. Verify Website Files

echo "Checking website files..."

if [ ! -f "$WEB_DIR/index.html" ]; then
    echo "ERROR: index.html not found!"
    exit 1
fi

echo "Website files copied successfully!"


# 9. Set Website Directory Permissions

echo "Setting website permissions..."

sudo chown -R www-data:www-data "$WEB_DIR"

sudo find "$WEB_DIR" -type d -exec chmod 755 {} \;

sudo find "$WEB_DIR" -type f -exec chmod 644 {} \;


# 10. Configure Nginx

echo "Creating Nginx configuration..."

sudo tee /etc/nginx/sites-available/mysite > /dev/null <<'EOF'
server {
    listen 80;
    listen [::]:80;

    server_name _;

    root /var/www/mysite;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
EOF


# 11. Enable Nginx Website Configuration

echo "Enabling website configuration..."

sudo ln -sf /etc/nginx/sites-available/mysite /etc/nginx/sites-enabled/mysite

sudo rm -f /etc/nginx/sites-enabled/default


# 12. Test Nginx Configuration

echo "Testing Nginx configuration..."

sudo nginx -t


# 13. Reload Nginx

echo "Reloading Nginx..."

sudo systemctl reload nginx


# 14. Verify Deployment

echo "Checking website response..."

curl -I http://localhost


# 15. Deployment Complete

echo "======================================"
echo " Server Setup Completed Successfully!"
echo "======================================"

echo "Git Version:"
git --version

echo "Nginx Status:"
sudo systemctl is-active nginx

echo "Website Directory: $WEB_DIR"

echo "Website URL: http://13.61.12.241"

echo "Firewall: Managed by AWS Security Groups"

echo "======================================"
echo " Your Static Website is Ready!"
echo "======================================"
