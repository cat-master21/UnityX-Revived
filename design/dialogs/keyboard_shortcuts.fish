#!/usr/bin/fish

zenity --list \
	--class='UnityX' \
	--title='Keyboard Shortcuts' \
	--text='A list of keyboard shortcuts can be found below.' \
	--column='Shortcut'   --column='Definition' \
	  'Alt+W'             'Show open windows' \
	  'Alt+A or Super+A'  'Show applications' \
	  'Alt+X'             'Terminate session' \
	  'Alt+S'             'Volume control'
