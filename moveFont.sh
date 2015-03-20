#!/bin/bash
# will move the file "shuttle.otf", which contains the modified "for personal gain"-font
# in the weight Regular to the directory for installed fonts on Ubuntu and similar systems.
# Another option could be to double click the font and install it using the default graphical
# method.
# You'll have to enter your admin password.

sudo cp -r ./shuttle.otf /usr/share/fonts/truetype/

if [[ -e /usr/share/fonts/truetype/shuttle.otf ]]; then
	echo "copy successful"
fi