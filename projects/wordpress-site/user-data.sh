#!/bin/bash
apt update -y
apt upgrade -y

# Install Apache, PHP, MySQL client, wget
apt install -y apache2 php php-mysql mysql-client wget unzip

# Enable Apache
systemctl enable apache2
systemctl start apache2

# Download WordPress
cd /var/www/html
wget https://wordpress.org/latest.zip
unzip latest.zip
rm latest.zip

# Move files up one level
mv wordpress/* .
rm -rf wordpress

# Set permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html