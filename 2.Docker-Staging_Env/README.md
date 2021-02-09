# 2.Docker-Staging_Env

## 1. Clone The Repo To Your Local Machine
###### Clone The Repo
```
git clone https://github.com/cysense-hq/devops.git
cd 2.Docker-Staging_Env
```

## 2. Prepare Your Project Files "App" - "DB Dump"
```
Create a Directory called "files", add app.zip file and dump.sql into it.
```

## 3. Run Shell Script To Deploy your App
```
sudo sh Deploy-app.sh
```

## 4. Wait Some Mins Until composer build the app
```
watch docker logs composer_oxid6
```

## 5. Fix Permission of app
```
docker exec app_oxid6 chown -R apache:apache /var/www/html/
```
