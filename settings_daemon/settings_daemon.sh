#!/usr/bin/bash
set -e
# Load desktop settings
bash settings_daemon/set-settings.sh &

# Load HUD gtk module
# See line 58, not at all usable
#export GTK3_MODULES="/usr/lib/libplotinus.so" || true
feh --bg-fill $(gsettings get org.gnome.desktop.background picture-uri | tail -c +9 | head -c -2 || echo '/usr/share/unityx/design/images/unityx-background1.png')
xfwm4 &

# Just in case
mkdir ~/Desktop || true

# Assign keybindings to rofi.
python3 keybindings/keybindings.py '<Alt>w' 'rofi -theme design/launcher/sidebar.rasi -show window' '' &
python3 keybindings/keybindings.py '<Super>a' 'rofi -theme design/launcher/sidebar.rasi -show drun' '' &
python3 keybindings/keybindings.py '<Alt>a' 'rofi -theme design/launcher/sidebar.rasi -show drun' '' &

# Add remaining keybindings
sh keybindings/add.sh &

# Launch panel
sleep 1 && polybar -c design/panel/unity_panel.ini main &

# Launch dock
sleep 0.5 && tint2 -c design/dock/dockrc &
polydock/bin/polydock &

# Show widgets (disabled for now)
# sleep 2 && fish -c 'for widget in ./design/widgets/*.conf; conky -c $widget &; end' &

# Run polkit authentication agent.
# May be able to use xdg instead
if [[ -f /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 ]]; then
      
      /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
elif [[ -f /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 ]]; then
      /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
else
      /usr/libexec/polkit-gnome-authentication-agent-1 & 
fi

# Execute autorun script, if it exists
# Will need to fix later due to a security concern...
bash ~/.config/unityx/autorun || true &

# Show the keyboard shortcuts dialog
# Needs to be changed to ../design/dialogs/..fish
zenity --list \
      --title='Keyboard Shortcuts' \
      --text='A list of keyboard shortcuts can be found below.' \
      --column='Shortcut'   --column='Definition' \
        'Alt+W'             'Show open windows' \
        'Alt+A or Super+A'  'Show applications' \
        'Alt+X'             'Terminate session' \
        'Super+X'           'Reload desktop.' \
        'Alt+S'             'Volume control.' &

# Show all the tray icons
sleep 1
blueman-applet &
# Disabled for now, is an odd/old indicator applet can be replaced...
#set lib_dir '/usr/lib/'(uname -i)'-linux-gnu'
#lib_dir/notify-osd & || /usr/lib/notify-osd/notify-osd &

# Launch the HUD
# Plotinus is old and not used anymore. Will remove was an alternative solution is found
#plotinus &

# Assign keybinding to log out.
python3 keybindings/keybindings.py '<Alt>x' 'exit' 'exit'

# Kill all background processes launched
kill $(jobs -p)
