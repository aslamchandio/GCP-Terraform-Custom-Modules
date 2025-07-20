#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install zip unzip wget net-tools dnsutils iputils-ping traceroute vim nano git htop tree ufw -y
sudo apt install mysql-client-core-8.0 -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo apt install nginx -y 
cd /var/www/html
sudo wget wget https://templatemo.com/download/templatemo_577_liberty_market/templatemo_577_liberty_market.zip
sudo unzip templatemo_577_liberty_market.zip
sudo mv  templatemo_577_liberty_market/ html
sudo rm -rf  templatemo_577_liberty_market.zip
sudo rm -rf index.nginx-debian.html
cd html
sudo cp -r * ..
cd ..
sudo rm -rf html
sudo echo 'y' | sudo ufw enable
sudo systemctl enable nginx --now
