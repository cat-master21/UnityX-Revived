#!/usr/bin/bash

# loginctl show-session $XDG_SESSION_ID | grep -oP "(?<=Service=).*" to show display-manager, then logout to it to logout
export action=$(zenity --list --title 'Session' --text "You are user \""$USER"\"." --column Option 'Log out' 'Suspend' 'Shutdown' 'Reboot')

if [ "$action" == "Log out" ]; then
	systemctl restart display-manager
elif [ "$action" == Suspend ]; then
	systemctl suspend
elif [ "$action" == Shutdown ]; then
	poweroff
elif [ "$action" == Reboot ]; then
	reboot
fi
