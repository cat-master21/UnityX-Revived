#!/usr/bin/bash

export action="$(zenity --list --title="UnityX Settings" --text="Choose one of the following configuration options:" --column="Options" 'Open Mate Control Center (if available)' 'Open UnityX specific Settings')"

if [ "$action" == "Open Mate Control Center (if available)" ]; then
	mate-control-center
elif [ "$action" == "Open UnityX specific Settings" ]; then
	zenity --info --text="This will be added later on when other goals are accomplished!"
fi
