#!/bin/bash
echo "Starting script execution..."
yum install wget unzip httpd -y
echo "Packages installed."
systemctl start httpd
echo "Httpd started."
systemctl enable httpd
echo "Httpd enabled."
wget https://www.tooplate.com/zip-templates/2117_infinite_loop.zip
echo "File downloaded."
unzip -o 2117_infinite_loop.zip
echo "File unzipped."
cp -r 2117_infinite_loop/* /var/www/html/
echo "Files copied to /var/www/html/."
systemctl restart httpd
echo "Httpd restarted."
