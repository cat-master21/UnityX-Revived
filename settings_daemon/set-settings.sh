#!/usr/bin/bash
set -e

function refresh() {
    echo 'Net/ThemeName "'$(gsettings get org.gnome.desktop.interface gtk-theme| tail -c +2 | head -c -2)'"' > ~/.unityx-xsettings
    echo 'Net/IconThemeName "'$(gsettings get org.gnome.desktop.interface icon-theme | tail -c +2 | head -c -2)'"' >> ~/.unityx-xsettings
}

refresh && xsettingsd -c ~/.unityx-xsettings &

export OLD_THEME="$(gsettings get org.gnome.desktop.interface gtk-theme)"
export OLD_ICON_THEME="$(gsettings get org.gnome.desktop.interface icon-theme)"

if [[ "$(gsettings get org.gnome.desktop.interface gtk-theme)" != "$OLD_THEME" ]]; then
	refresh && fish -c 'pkill xsettingsd && xsettingsd -c ~/.unityx-xsettings' &
	export OLD_THEME="$(gsettings get org.gnome.desktop.interface gtk-theme)"
elif [[ "$(gsettings get org.gnome.desktop.interface icon-theme)" != "$OLD_ICON_THEME" ]]; then
	refresh && fish -c 'pkill xsettingsd && xsettingsd -c ~/.unityx-xsettings' &
	export OLD_ICON_THEME="$(gsettings get org.gnome.desktop.interface icon-theme)"
fi

