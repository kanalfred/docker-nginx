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

# Env Vars
echo '#Docker Env Vars\r\n' > /etc/profile.d/docker.sh
echo '#Docker Env Vars\r\n' > /etc/nginx/env.d/docker.conf

if [ ! -z "$apple" ]; then
    mkdir -p etc/nginx/env.d 
    echo fastcgi_param apple \'${apple}\'\; >> /etc/nginx/env.d/docker.conf;
    echo fastcgi_param APPLE2 ${apple}\; >> /etc/nginx/env.d/docker.conf;
    #echo export apple=${apple} >> /etc/profile.d/docker.sh
fi


/usr/bin/supervisord -n -c /etc/supervisord.conf
