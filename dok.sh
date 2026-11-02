#!/bin/sh

if [ ! $1 ]; then
    echo "please specify container to connect to"
    exit 1;
fi

if [ $(basename $0) = sudok ]; then
    user="-u root"
else
    if [ $2 ]; then
        user="-u $2"
    else
        user="-u 1000:1000"
    fi
fi

docker exec $user -ti $(docker ps |grep $1 |awk '{ print $1 }') bash
