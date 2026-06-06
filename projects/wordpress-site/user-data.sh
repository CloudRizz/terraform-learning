#!/bin/bash
set -e

apt update -y

# Install required packages
apt install -y apache2 wget unzip php php-mysql libapache2-mod-php

systemctl enable apache2
systemctl start apache2

# Clean web root
rm -rf /var/www/html/*

# Download WordPress
cd /tmp
wget https://wordpress.org/latest.zip
unzip latest.zip

cp -R wordpress/* /var/www/html/

# Permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Create wp-config.php
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Inject DB settings from Terraform variables
sed -i "s/database_name_here/${db_name}/" /var/www/html/wp-config.php
sed -i "s/username_here/${db_user}/" /var/www/html/wp-config.php
sed -i "s/password_here/${db_password}/" /var/www/html/wp-config.php
sed -i "s/localhost/${db_host}/" /var/www/html/wp-config.php

systemctl restart apache2