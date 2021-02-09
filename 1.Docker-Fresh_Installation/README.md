# 1.Docker-Fresh_Installation

## 1. Clone The Repo To Your Local Machine
###### Clone The Repo
```
git clone https://github.com/cysense-hq/devops.git
cd 1.Docker-Fresh_Installation
```

## 2. Run Shell Script To Deploy your App
```
sh Deploy-app.sh
```

## 3. Wait Some Mins Until composer build the app
```
watch docker logs composer_oxid6
```

## 4. Fix Permission of app
```
docker exec app_oxid6 chown -R apache:apache /var/www/html/
```
