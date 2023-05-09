#!/usr/bin/fish

# Volume control
python3 keybindings/keybindings.py '<Alt>s' 'pavucontrol' '' &
python3 keybindings/keybindings.py 'XF86AudioRaiseVolume' "sh ./keybindings/vol.sh up" '' &
python3 keybindings/keybindings.py 'XF86AudioLowerVolume' "sh ./keybindings/vol.sh down" '' &
python3 keybindings/keybindings.py 'XF86AudioMute' "sh ./keybindings/vol.sh mute" '' &
python3 keybindings/keybindings.py '<Super>x' "sh keybindings/reload_desktop.sh" '' &
