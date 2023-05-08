function refresh
    echo 'Net/ThemeName "'(gsettings get org.gnome.desktop.interface gtk-theme| tail -c +2 | head -c -2)'"' > ~/.unityx-xsettings
    echo 'Net/IconThemeName "'(gsettings get org.gnome.desktop.interface icon-theme | tail -c +2 | head -c -2)'"' >> ~/.unityx-xsettings
end

refresh && xsettingsd -c ~/.unityx-xsettings &

set OLD_THEME (gsettings get org.gnome.desktop.interface gtk-theme)
set OLD_ICON_THEME (gsettings get org.gnome.desktop.interface icon-theme)

while true
    sleep 2
    if [ (gsettings get org.gnome.desktop.interface gtk-theme) != "$OLD_THEME" ]
        refresh && fish -c 'pkill xsettingsd && xsettingsd -c ~/.unityx-xsettings' &
        set OLD_THEME (gsettings get org.gnome.desktop.interface gtk-theme)
    else if [ (gsettings get org.gnome.desktop.interface icon-theme) != "$OLD_ICON_THEME" ]
        refresh && fish -c 'pkill xsettingsd && xsettingsd -c ~/.unityx-xsettings' &
        set OLD_ICON_THEME (gsettings get org.gnome.desktop.interface icon-theme)
    end
end
