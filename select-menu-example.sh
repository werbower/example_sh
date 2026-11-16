#!/bin/bash

delay=3
PS3="
Enter selection [1-4] > "


select str in \
		"Display System Information" \
		"Display Disk Space" \
		"Display Home Space Utilization" \
		"Quit"; do
		
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
		if [[ "$REPLY" == 4 ]]; then
			break
		fi

	if [[ -z "$str" ]]; then
		echo "invalid entry"
		sleep "$delay"
	fi

done
