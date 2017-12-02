#!/bin/sh

if [ -z "$(which xwininfo)" ]; then
    echo "xwininfo must be installed for xwinid to work";
    exit 1;
fi

echo "Click on a window to get the window ID"
xwininfo |grep "Window id" |sed "s/xwininfo: Window id: \(0x[0-9a-f]\+\).*/\1/" |xargs printf "%d\n"
