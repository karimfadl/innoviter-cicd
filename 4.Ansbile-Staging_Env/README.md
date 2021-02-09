# 4.Ansbile-Staging_Env

## 1. Clone The Repo To Your Local Machine
###### Clone The Repo
```
git clone https://github.com/cysense-hq/devops.git
cd 4.Ansbile-Staging_Env
```

## 2. Add Your Ansible Client Server IP
```
open "hosts" file and Replace 192.168.1.150 to XX.XX.XX.XX (Ansible Client Based On Ubuntu 18)
```

## 3. Add Your DB and App Configurations
```
open "group_vars/all" file and you can replace All Vars to match your environment
open "app.yml" file and Replace Ansible client "user" and "password" to match your target client
```

## 4. Add Your DB and App files 
```
open "files" Dir and you can Add app.zip and dump.sql files of your environment
```

## 5. Run Ansible Playbook
```
ansible-playbook -i hosts app.yml -k
```
