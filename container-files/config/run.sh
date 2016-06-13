#!/bin/bash

# Add require nginx dirs
NGINX_LOGS='/data/logs'
NGINX_TMP='/data/tmp/nginx/client_temp'

if [ ! -d "$NGINX_LOGS" ]; then
    mkdir -p $NGINX_LOGS 
    chown -R nginx:hostadmin $NGINX_LOGS
fi

if [ ! -d "$NGINX_TMP" ]; then
    mkdir -p $NGINX_TMP 
    chown -R nginx:hostadmin $NGINX_TMP
fi


/usr/bin/supervisord -n -c /etc/supervisord.conf
