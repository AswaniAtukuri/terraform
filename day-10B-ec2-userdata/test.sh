#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start  
sudo systemctl enable httpd
echo "<h1>Welcome to Naresh IT ! AWS" > /var/www/html/index.html