#!/bin/bash
BACKUP_DIR="$HOME/backups"
DATE=$(date +%F_%H-%M)
mkdir -p $BACKUP_DIR

tar -czf $BACKUP_DIR/website_$DATE.tar.gz /var/www/mysite

# keep only the last 7 backups
ls -t $BACKUP_DIR/website_*.tar.gz | tail -n +8 | xargs -r rm
echo "Backup saved: website_$DATE.tar.gz"