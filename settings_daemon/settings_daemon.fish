function settings_daemon --description 'Settings daemon'
    # Load xsettings
    fish settings_daemon/xsettings.fish &

    # Load HUD gtk module
    [ "$GTK3_MODULES" = "" ] && export GTK3_MODULES="/usr/lib/libplotinus.so" || true
    fish -c "while true; sleep 1 && feh --bg-fill (gsettings get org.gnome.desktop.background picture-uri | tail -c +9 | head -c -2 || echo '/usr/share/unityx/design/images/unityx-background1.png'); end" &
    xfwm4 &

    # mkdir Desktop in the home directory
    mkdir ~/Desktop

    # Assign keybindings to rofi.
    fish -c "cd ~/Desktop && python3 "(echo $PWD)"/keybindings/keybindings.py '<Alt>w' 'rofi -theme "(echo $PWD)"/design/launcher/sidebar.rasi -show window' ''" &
    fish -c "cd ~/Desktop && python3 "(echo $PWD)"/keybindings/keybindings.py '<Super>a' 'rofi -theme "(echo $PWD)"/design/launcher/sidebar.rasi -show drun' ''" &
    fish -c "cd ~/Desktop && python3 "(echo $PWD)"/keybindings/keybindings.py '<Alt>a' 'rofi -theme "(echo $PWD)"/design/launcher/sidebar.rasi -show drun' ''" &

    # Add remaining keybindings.
    fish keybindings/add.fish &

    # Launch panel.
    sleep 1 && fish -c 'polybar -c design/panel/unity_panel.ini main' &

    # Launch dock.
    sleep 0.5 && tint2 -c design/dock/dockrc &
    polydock/bin/polydock &

    # Show widgets (disabled for now)
    # sleep 2 && fish -c 'for widget in ./design/widgets/*.conf; conky -c $widget &; end' &

    # Run polkit authentication agent.
    /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

    # Execute autorun script, if it exists.
    fish -c '~/.config/unityx/autorun || true' &

    # Show the keyboard shortcuts dialog
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
    set lib_dir '/usr/lib/'(uname -i)'-linux-gnu'
    $lib_dir/notify-osd & || /usr/lib/notify-osd/notify-osd &

    # Launch the HUD
    plotinus &

    # Assign keybinding to log out.
    python3 keybindings/keybindings.py '<Alt>x' 'exit' 'exit'

    # Kill all background processes launched
    kill (jobs -p)
end
