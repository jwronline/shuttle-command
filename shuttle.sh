#!/bin/bash

# colours
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0m'

while [[ $lang != "/001" && $lang != "/002" ]]; do
	echo "language:"
	echo "EN (/001)"
	echo "NL (/002)"
	read lang
done

case $lang in
	"/001" )
		echo -e "${green}English${NC}"
		helpmes="Press \"HELP\" \"EXEC\" for help"
		posnum="Enter your position number"
		surexit="Are you sure you want to exit your position?"
		exitng="exiting"
		posis="Your position is:"
		enterops="Enter your operation"
		posinfo="Enter \"POS\", your position number, \"EXEC\""
		initialised="initialised. Enter the item."
		corr="correct code"
		err="wrong code"
		iteminfo="Enter \"ITEM\", your item number  \"EXEC\""
		opsinfo="Enter \"OPS\", your operation number  \"EXEC\""
		;;
	"/002" )
		echo -e "${green}Nederlands${NC}"
		helpmes="Druk op \"HELP\" \"EXEC\" voor hulp"
		posnum="Voer een positienummer in"
		surexit="Wil je je plaats zeker afstaan?"
		exitng="Je bent nu niet meer"
		posis="Je positie is:"
		enterops="Voer je operatie in"
		posinfo="Voer \"POS\", dan je positienummer, en dan \"EXEC\" in"
		initialised="geïnitialiseerd. Voer het item in."
		corr="code correct"
		err="foute code"
		iteminfo="Voer \"ITEM\", dan je positienummer, en dan \"EXEC\" in"
		opsinfo="Voer \"OPS\", dan je positienummer, en dan \"EXEC\" in"
		;;
esac

echo "$helpmes"

function newPos() {
	echo -e "${red}$surexit${NC}"
	read exitting
	if [[ $exitting == "/999" ]]; then
		echo "$exitng $pos"
		exitting=true
	fi
}

function position() {
	echo "$posnum"
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
			"-004" )
				pos="WXT"
				;;
			"-005" )
				pos="LD"
				;;
			"-006" )
				pos="ELSS"
				;;
			"-007" )
				pos="SSO"
				;;
			"-008" )
				pos="PAO"
				;;
			"+" )
				echo "$posinfo"
				;;
		esac
		if [[ $pos != 0 ]]; then
			echo "$posis $pos"
		fi
	done
}

function CMDR() {
	echo "$enterops"
	read operation

	case $operation in
		"*001" )
			echo "$operation $initialised"
			exits=0
			while [[ $exits == 0 ]]; do
				read item
				case $item in
					"/001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" )
						echo "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" )
			newPos
			;;
		"+" )
			echo "$opsinfo"
			;;
	esac
}

function PLT() {
	echo "$enterops"
	read operation

	case $operation in
		"*001" )
			echo "$operation $initialised"
			exits=0
			while [[ $exits == 0 ]]; do
				read item
				case $item in
					"/001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" )
						echo "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" )
			newPos
			;;
		"+" )
			echo "$opsinfo"
			;;
	esac
}

function FD() {
	echo "$enterops"
	read operation

	case $operation in
		"*001" )
			echo "$operation $initialised"
			exits=0
			while [[ $exits == 0 ]]; do
				read item
				case $item in
					"/001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" )
						echo "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" )
			newPos
			;;
		"+" )
			echo "$opsinfo"
			;;
	esac
}

function WXT() {
	echo "$enterops"
	read operation

	case $operation in
		"*001" )
			echo "$operation $initialised"
			exits=0
			while [[ $exits == 0 ]]; do
				read item
				case $item in
					"/001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" )
						echo "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" )
			newPos
			;;
		"+" )
			echo "$opsinfo"
			;;
	esac
}

function LD() {
	echo "$enterops"
	read operation

	case $operation in
		"*001" )
			echo "$operation $initialised"
			exits=0
			while [[ $exits == 0 ]]; do
				read item
				case $item in
					"/001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" )
						echo "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" )
			newPos
			;;
		"+" )
			echo "$opsinfo"
			;;
	esac
}

function ELSS() {
	echo "$enterops"
	read operation

	case $operation in
		"*001" )
			echo "$operation $initialised"
			exits=0
			while [[ $exits == 0 ]]; do
				read item
				case $item in
					"/001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" )
						echo "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" )
			newPos
			;;
		"+" )
			echo "$opsinfo"
			;;
	esac
}

function SSO() {
	echo "$enterops"
	read operation

	case $operation in
		"*001" )
			echo "$operation $initialised"
			exits=0
			while [[ $exits == 0 ]]; do
				read item
				case $item in
					"/001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" )
						echo "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" )
			newPos
			;;
		"+" )
			echo "$opsinfo"
			;;
	esac
}

function PAO() {
	echo "$enterops"
	read operation

	case $operation in
		"*001" )
			echo "$operation $initialised"
			exits=0
			while [[ $exits == 0 ]]; do
				read item
				case $item in
					"/001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" )
						echo "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" )
			newPos
			;;
		"+" )
			echo "$opsinfo"
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
			"FD" )
				FD
				;;
			"WXT" )
				WXT
				;;
			"LD" )
				LD
				;;
			"ELSS" )
				ELSS
				;;
			"SSO" )
				SSO
				;;
			"PAO" )
				PAO
				;;
		esac
	done
	exitting=false
done