#!/bin/sh
find "$2" -name "*\.py" -print0 |xargs -0 grep $3 "$1"
