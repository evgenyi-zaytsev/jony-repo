#!/bin/bash
TERM=dumb
chmod -Rf 777 /root/phpCrawler/log/
cd /root/test/tools
mkdir -p /root/phpCrawler/log/killer
sudo /usr/bin/php -f Killer.php &>> /root/phpCrawler/log/killer/killer.log 
