#!/bin/sh
find "$2" -name "*\.gd" -print0 |xargs -0 grep $3 "$1"
