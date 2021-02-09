#!/bin/bash

#Ask the user for his DB name
echo Hello, What is your DataBase Name That you need to Create for App For example "oxid"?
read vardbname

#Ask the user for his DB User
echo What is your DataBase User That you need to Create for App For example "admin"?
read vardbuser

#Ask the user for his DB User Password
echo What is your DataBase User Password That you need to Create for App For example "oxid1234"?
read vardbuserpass

#Ask the user for his Domain URL
echo Finally What is your Domain URL That you need to Create for App For example "oxid.local"?
read vardomain

#Change .env and app config file with the new varaibles.
echo Start to Change Config files with the new values ...
sed -i 's/dbname/'"$vardbname"'/g' ./.env
sed -i 's/dbuser/'"$vardbuser"'/g' ./.env
sed -i 's/dbpass/'"$vardbuserpass"'/g' ./.env
sed -i 's/appurl/'"$vardomain"'/g' ./.env

sed -i 's/dbname/'"$vardbname"'/g' ./config/app-config/config.inc.php
sed -i 's/dbuser/'"$vardbuser"'/g' ./config/app-config/config.inc.php
sed -i 's/dbpass/'"$vardbuserpass"'/g' ./config/app-config/config.inc.php
sed -i 's/appurl/'"$vardomain"'/g' ./config/app-config/config.inc.php

#Extract The App files (oxideshop) and configure it
echo Start to Deploy App by extract Zip Files and Apply the New Configuration ...
unzip ./files/app.zip
cp -r ./config/app-config/config.inc.php  ./app/source

#Deploy all Containers through Docker Compose
echo Start to Run All Containers  ...
docker-compose up -d

#Sleep For 1 Min until Database be running
echo Please Wait Until All Containers running ...
sleep 60

#Import DB Dump
echo "Start to Import The Database ..."
mysql -u root -p'root' $vardbname --protocol TCP < ./files/dump.sql

#Note
echo "PLEASE Dont' Forget to add the following to /etc/hosts: 127.0.0.1	$vardomain"
echo "Open Your Browser Now to Check The app through this Link: $vardomain"
