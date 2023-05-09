# Unityx from scratch

A fork of UnityX before it changed to a fork of Unity7. With this being primarily from Fish + Python.
Currently a rewrite in Dash (fast Posix shell) is in progress.
## Wayland Progress
* [ ] Convert scripts to bash or Sh (defaults to Dash or Bash)
* [ ] Use Wayfire (Wayland)
* [ ] Move away from Tint2 (`design/dock`) and use `nwg-panel`
* [ ] Convert settings to Zenity (Gtk4) from Python
* [ ] Use Pipewire (`keybindings/vol.sh`) instead of Pulseaudio

## Why move away from Fish and change things?
From research done, Fish isn't that fast, and Dash is significantly faster. Overall, many users wouldn't have fish installed as the default Shell so it is yet another dependency.