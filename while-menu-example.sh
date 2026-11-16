#!/bin/bash

delay=3

while true; do
	clear
	cat << _EOF_
		Please select:
		1. Display System Information
		2. Display Disk Space
		3. Display Home Space Utilization
		0. Quit
_EOF_

	read -r -p "Enter selection [0-3] > "
	if [[ "$REPLY" =~ ^[0-3]$ ]]; then
		if [[ $REPLY == 1 ]]; then
			echo "Hostname: $HOSTNAME"
			uptime
			sleep "$delay"
			continue
		fi

		if [[ "$REPLY" == 2 ]]; then
			df -h
			sleep "$delay"
			continue
		fi
		if [[ "$REPLY" == 3 ]]; then
			if [[ "$(id -u)" -eq 0 ]]; then
				echo "Home space utilization (all users)"
				du -sh /home/*
			else
				echo "Home space utilization ($USER)"
				du -sh "$HOME"
			fi
			sleep "$delay"
			continue
		fi
		if [[ "$REPLY" == 0 ]]; then
			break
		fi
	else
		echo "invalid entry"
		sleep "$delay"
	fi

done
