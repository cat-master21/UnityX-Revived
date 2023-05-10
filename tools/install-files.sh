#!/usr/bin/bash
set -e
cd "$(dirname "$0")/.."

if [[ ! -d "$1" ]]; then 
echo "No or nonexistent directory to install into ($1)"
exit 1
fi

mkdir -p "$1"/usr/share/fonts/truetype/unityx "$1"/usr/share/icons/hicolor/512x512/apps/ "$1"/usr/share/xsessions
cp xsessions/unityx.desktop "$1"/usr/share/xsessions
cp design/fonts/* "$1"/usr/share/fonts/truetype/unityx

mkdir -p "$1"/usr/share/applications
cp applications/* "$1"/usr/share/applications
cp design/images/ubuntu-unity-logo.png "$1"/usr/share/icons/hicolor/512x512/apps

mkdir -p "$1"/usr/share/unityx
cp -r ./applications \
./design \
./keybindings \
./polydock \
./settings \
./settings_daemon \
./sounds \
./testing "$1"/usr/share/unityx
cp unityx "$1"/usr/share/unityx

echo "Complete"
