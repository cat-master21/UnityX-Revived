cd (dirname (status -f))/..

[ ! -d "$DESTDIR" ]; and echo "No such directory: $DESTDIR"
[ ! -d "$DESTDIR" ]; and exit

mkdir -p $DESTDIR/usr/share/fonts/truetype/unityx $DESTDIR/usr/share/icons/hicolor/512x512/apps/ $DESTDIR/usr/share/xsessions
cp xsessions/unityx.desktop $DESTDIR/usr/share/xsessions
cp design/fonts/* $DESTDIR/usr/share/fonts/truetype/unityx

mkdir -p $DESTDIR/usr/share/applications
cp applications/* $DESTDIR/usr/share/applications
cp design/images/ubuntu-unity-logo.png $DESTDIR/usr/share/icons/hicolor/512x512/apps

mkdir -p $DESTDIR/usr/share/unityx
cp -r ./*/ $DESTDIR/usr/share/unityx; and \
  rm -r $DESTDIR/usr/share/unityx/xsessions
cp unityx $DESTDIR/usr/share/unityx
