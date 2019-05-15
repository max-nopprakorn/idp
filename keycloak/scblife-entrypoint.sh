#!/usr/bin/env bash

if [ "$KEYCLOAK_ENV" == "production" ];
  then
    echo "start configuration"

    export DB_VENDOR="POSTGRES"
    export LOG_FILE="/tmp/keycloak.log"
    export ENV=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)
    export KUBE_TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
    
    # Config DB
    export DB_VENDOR="POSTGRES"
    
fi


exec /opt/jboss/tools/docker-entrypoint.sh "$@"
