#!/usr/bin/env bash
HAS_KEYCLOAK_HOST=$(cat /etc/hosts | grep '[[:space:]]keycloak' | wc -l)
if [ $HAS_KEYCLOAK_HOST -eq 0 ]
  then
    echo 'Adding keycloak to your /etc/hosts'
    HOSTS_LINE="\n127.0.0.1  keycloak"
    sudo -- sh -c -e "echo '$HOSTS_LINE' >> /etc/hosts";
fi

docker-compose up --build


