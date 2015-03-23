#!/bin/bash
# will move the file "font.otf", which contains the modified "for personal gain"-font
# in the weight Regular to the directory for installed fonts on Ubuntu and similar systems.
# Another option could be to double click the font and install it using the default graphical
# method.
# You'll have to enter your admin password.

sudo cp -r ./font.otf /usr/share/fonts/truetype/

if [[ -e /usr/share/fonts/truetype/font.otf ]]; then
	echo "copy successful"
fi