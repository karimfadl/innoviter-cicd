# Virtual Servers

* v45526.1blu.de (2 CPU-Cores, 4 GB RAM, 120 GB SSD)
* v37395.1blu.de (4 CPU-Cores, 12 GB RAM, 240 GB SSD)


## v45526.1blu.de (Staging)

Setup 1: kaufhausHESSEN Online Shop

```puml
@startuml

cloud www
frame kfhs_shop {
  node apache2
  database MySQL
  file oxid_src
}
file dump
file media
www -- apache2
apache2 -- MySQL
apache2 .. oxid_src
oxid_src .. media
MySQL .. dump

@enduml
```

Setup 2: Drupal (for different web sites)

```puml
@startuml

cloud www
frame zmxp_web {
  node nginx
  database MySQL
  file drupal
}
file dump
file components
file media
www -- nginx
nginx -- MySQL
nginx .. drupal
drupal .. media
drupal .. components
MySQL .. dump

@enduml
```

Setup 3: Docker

```puml
@startuml

cloud www
frame Docker {
  component traefik
  node cysn_web
  node innv_web
  node zllr_web
  node ihlt_web
}
www -- traefik
traefik -- cysn_web
traefik -- innv_web
traefik -- zllr_web
traefik -- ihlt_web

@enduml
```

Docker container:

* cysn_web
    * Docker image: [nginx:alpine](https://hub.docker.com/_/nginx/) 
* innv_web
    * Docker image: [nginx:alpine](https://hub.docker.com/_/nginx/) 
* zllr_web
    * Docker image: [nginx:alpine](https://hub.docker.com/_/nginx/) 

Domains:

* cysen.se

## v37395.1blu.de (Production)

Domains:

* cysense.de
* innoviter.com
* zoeller.biz
