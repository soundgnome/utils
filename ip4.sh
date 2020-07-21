ip addr |grep 'inet ' |egrep -v 'docker|127.0.0.1' |awk '{print $2}' |sed -e 's/\/.*//'
