#!/bin/sh
find "$2" -name "*\.php" -print0 |xargs -0 grep $3 "$1"
