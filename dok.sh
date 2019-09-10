#!/bin/sh

if [ ! $1 ]; then
    echo "please specify container to connect to"
    exit 1;
fi

docker exec -ti $(docker ps |grep $1 |awk '{ print $1 }') bash
