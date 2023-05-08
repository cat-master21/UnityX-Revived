import os, sys
import gi

gi.require_version ('Gtk', '3.0')
gi.require_version ('Keybinder', '3.0')

from gi.repository import Gtk
from gi.repository import Keybinder

def callback (keystr, user_data):
	os.system (sys.argv [2])
	if sys.argv [3] == 'exit': exit ()

if __name__ == '__main__':
	keystr = sys.argv [1]
	Keybinder.init ()
	Keybinder.bind (keystr, callback, "Keystring %s (user data)" % keystr)
	Gtk.main ()
