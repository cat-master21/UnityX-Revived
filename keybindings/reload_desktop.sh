#!/usr/bin/sh
pkill -9 polybar; sleep 1 && fish -c 'polybar -c design/panel/unity_panel.ini main' &
pkill -9 conky; sleep 1 && fish -c 'for widget in ./design/widgets/*.conf; conky -c $widget &; end' &
# Add NWG-panel, look at wiki and remove conky/polybar, this file may be unnecessary
