#!/bin/bash

#Clone The App files (oxideshop) and configure it
git clone https://github.com/OXID-eSales/oxideshop_ce.git

#Add Project Config file.
cp ./oxideshop_ce/source/config.inc.php.dist ./oxideshop_ce/source/config.inc.php
sed -i '/$this->blSkipViewUsage = false;/c\$this->blSkipViewUsage = true;' ./oxideshop_ce/source/config.inc.php

#Deploy all Containers through Docker Compose 
docker-compose up -d

#Sleep For 1 Min until Database be running
echo "Please Wait Until All Containers running ..."
sleep 60

#Note
echo "PLEASE Dont' Forget to add the following to /etc/hosts: 127.0.0.1	oxid6.localhost"
echo "Open Your Browser Now to Check The app through this Link: oxid6.localhost"
