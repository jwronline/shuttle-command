#!/bin/bash

if [[ true ]]; then #only when it isn't installed yet
	echo "installing autokey. Enter your password"
	sudo apt-get install autokey
fi

if [[ false ]]; then
	echo "moving the configuration files"
	mv shuttle ~/.config/autokey
fi
