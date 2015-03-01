#!/bin/bash

# colours
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0m'

echo "press \"HELP\" \"EXEC\" for help"

function position() {
	echo "enter your position number"
	pos="0"
	while [[ $pos == "0" ]]; do
		read position

		case $position in
			"-001" )
				pos="CMDR"
				;;
			"-002" )
				pos="PLT"
				;;
			"-003" )
				pos="FD"
				;;
			"+" )
				pos="+"
				echo "enter \"POS\", your position number  \"EXEC\""
				;;
		esac
		if [[ $pos != 0 ]]; then
			echo "your position is $pos"
		fi
	done
}

function CMDR() {
	echo "enter your operation"
	read operation

	case $operation in
		"*001" )
			echo "$operation initialised. Enter the item."
			exits=0
			while [[ $exits == 0 ]]; do
				read item
				case $item in
					"/001" )
						echo -e "${green}correct code${NC}"
						exits=1
						;;
					"+" )
						echo "enter \"ITEM\", your item number  \"EXEC\""
						;;
					* )
						echo -e "${red}wrong code${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" )
			echo -e "${red}Are you sure you want to exit?${NC}"
			read exitting
			if [[ $exitting == "999" ]]; then
				echo "exiting $pos"
				exitting=true
			fi
			;;
		"+" )
			echo "enter \"OPS\", your operation number  \"EXEC\""
			;;
	esac
}

function PLT() {
	echo "enter your operation"
	read operation

	case $operation in
		"*001" )
			echo "$operation initialised. Enter the item."
			exits=0
			while [[ $exits == 0 ]]; do
				read item
				case $item in
					"/001" )
						echo -e "${green}correct code${NC}"
						exits=1
						;;
					"+" )
						echo "enter \"ITEM\", your item number  \"EXEC\""
						;;
					* )
						echo -e "${red}wrong code${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" )
			echo -e "${red}Are you sure you want to exit?${NC}"
			read exitting
			if [[ $exitting == "999" ]]; then
				echo "exiting $pos"
				exitting=true
			fi
			;;
		"+" )
			echo "enter \"OPS\", your operation number  \"EXEC\""
			;;
	esac
}

while [[ true ]]; do
	position
	while [[ $exitting != true ]]; do
		case $pos in
			"CMDR" )
				CMDR
				;;
			"PLT" )
				PLT
				;;
		esac
	done
	exitting=false
done