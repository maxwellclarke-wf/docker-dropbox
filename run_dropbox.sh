#!/usr/bin/env bash

# ensure enough file watchers
sysctl fs.inotify.max_user_instances=256
sysctl fs.inotify.max_user_watches=1048576

# run dropbox daemon in the background while occasionally pinging file watchers for relevant data
#/home/.dropbox-dist/dropboxd

while :
do
	dropbox.py running
	if [ $? -eq 0 ]
	then
		/home/.dropbox-dist/dropboxd &
	fi
	dropbox.py status
	sleep 5
done

sleep 600