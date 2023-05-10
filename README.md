# Unityx from scratch

A fork of UnityX before it changed to a fork of Unity7. With this being primarily from Fish + Python.
Currently a rewrite in Dash (fast Posix shell) is in progress.
## Wayland Progress
* [ ] Convert scripts to bash or Sh (defaults to Dash or Bash)
* [ ] Use Wayfire (Wayland)
* [ ] Move away from Tint2 (`design/dock`) and use `nwg-panel`
* [ ] Convert settings to Zenity (Gtk4) from Python
* [ ] Use Pipewire (`keybindings/vol.sh`) instead of Pulseaudio
* [ ] Other modernization's

## Why move away from a bunch of these dependencies?
First, from what I've seen, Fish isn't the fastest shell, I give that to Dash which links to `sh` by default. Some components like [notify-osd](https://bazaar.launchpad.net/~indicator-applet-developers/notify-osd/trunk/files) which is pretty obscure, Ubuntu based (Ubuntu's old indicators instead of Ayatana Indicators), and old with the last commit in 2019 and it's commit history wasn't steady. There are various reasons, but this project tries to get closer to regular Unity.

## List of project dependencies
### Before:
```
xdotool
fish
bash
xfwm4
xfce-panel
python3
polybar
nemo
gtk3
xorg
pavucontrol
zenity
tint2
rofi
feh
blueman
notify-osd
alsa-utils
arandr
network-manager-gnome
paplay
```

### After:
```
xdotool
fish
bash
xfwm4
xfce-panel
python3
polybar
nemo
gtk3
xorg
pavucontrol
zenity
tint2
rofi
feh
blueman
notify-osd
alsa-utils
arandr
network-manager-gnome
paplay
```