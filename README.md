# API Identity Provider

## Description

This project is the scblife custom version of keycloak, we can create new providers and new themes

## Prerequisite

- Docker + docker-compose
- Add `127.0.0.1 keycloak` to your `/etc/hosts`

## Getting started

To launch the project on local you need to have docker installed then you can run the command : 
```
$ ./bootstrap.sh
```

The command will compile the provider, and run :

- Keycloak : http://keycloak:8080
- sample-webapp : http://localhost:8081




