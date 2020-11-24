#!/bin/sh
local file prev_ip curr_ip
file=./last_ip
if [[ ! -f "$file" ]]; then
    echo "previous_inet: 0" > $file
fi
prev_ip=$(cat "$file" | cut -d " " -f 2)
curr_ip=$(ip addr show pppoe-wan | awk '/inet/{ print $2 }')
if [[ "$prev_ip" != "$curr_ip" ]]; then
    /etc/init.d/asterisk restart
    sed -i "s/${prev_ip}/${curr_ip}/" $file
fi
