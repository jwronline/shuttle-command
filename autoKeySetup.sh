#!/bin/bash

if [[ true ]]; then #only when it isn't installed yet
	sudo apt-get install autokey
fi

if [[ false ]]; then
	mv shuttle ~/.config/autokey
fi