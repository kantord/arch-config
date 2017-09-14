#!/bin/bash

eval `ssh-agent`
ssh-add
while true;
do
    rm /tmp/remaining_tasks_tmp.txt
    ssh kdani@kdani.duckdns.org "task +DUETODAY or +OVERDUE export" >> /tmp/remaining_tasks_tmp.txt
    ssh kdani@192.168.0.120 "task +DUETODAY or +OVERDUE export" >> /tmp/remaining_tasks_tmp.txt
    cat /tmp/remaining_tasks_tmp.txt | sed "s/,$//" | jq '[.status, .urgency, .description]' -c -r | grep -e '^\["pending"' | jq -s '. | sort_by(-(.[1] | tonumber)) | ([.[0:2][][2][:30]] | join(", ")) + " and " + (.[2:] | length | tostring) + " more"' -r > ~/.remaining_tasks
done
