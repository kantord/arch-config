#!/bin/bash

eval `ssh-agent`
ssh-add
while true;
do
    ssh kdani@kdani.duckdns.org "task +DUETODAY or +OVERDUE export" | sed "s/,$//" | jq '[.status, .urgency, .description]' -c -r | grep -e '^\["pending"' | jq -s '. | sort_by(-(.[1] | tonumber)) | ([.[0:2][][2][:30]] | join(", ")) + " and " + (.[2:] | length | tostring) + " more"' -r >> /tmp/remaining_tasks_tmp.txt
    cat /tmp/remaining_tasks_tmp.txt | grep -v -e "^\$" | head -n1 > ~/.remaining_tasks
    rm /tmp/remaining_tasks_tmp.txt
done
