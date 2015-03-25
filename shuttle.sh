#!/bin/bash
clear
# colours
red='\033[0;31m'
green='\033[0;32m'
blue='\033[01;34m'
NC='\033[0m'

# choosing input method
while [[ true ]]; do
	echo "choose your input method: "
	echo "kies je inputmethode: "
	echo -n -e "${blue}>${NC}"
	read inputmethod
	if [[ $inputmethod == "/001" || $inpumethod == "ITEM001" ]]; then
		# input method without replacement
		function input() {
			echo -e "$1"
			echo -n -e "${blue}>${NC}"
			read $2
		}
		break
	elif [[ $inputmethod == "/002" || $inpumethod == "ITEM002" ]]; then
		# input with replacement
		function input() {
			echo -e "$1"
			echo -n -e "${blue}>${NC}"
			local __resultvar=$2
			read -s myresult
			myresult=$(sed 's/\//ITEM/;s/-/POS/;s/*/OPS/;s/+/HELP/' <<< $myresult)
			echo $myresult
			eval $__resultvar="'$myresult'"
		}
		break
	fi
done

# language selection
while [[ true ]]; do
	input "language: " lang

	case $lang in
		"/001" | "ITEM001" )
			echo -e "${green}English${NC}"
			helpmess="Press ${green}HELP${NC} ${red}EXEC${NC} for help"
			posnum="Enter your position number"
			nopos="${red}That is not valid position${NC}"
			surexit="Are you sure you want to exit your position?"
			exitng="exiting"
			posis="Your position is:"
			enterops="Enter your operation"
			posinfo="Enter ${green}POS${NC}, your position number, ${red}EXEC${NC}"
			initialised="initialised. Enter the item."
			corr="correct code"
			err="wrong code"
			iteminfo="Enter ${green}ITEM${NC}, your item number  ${red}EXEC${NC}"
			opsinfo="Enter ${green}OPS${NC}, your operation number  ${red}EXEC${NC}"
			break
			;;
		"/002" | "ITEM002" )
			echo -e "${green}Nederlands${NC}"
			helpmess="Druk op ${green}HELP${NC} ${red}EXEC${NC} voor hulp"
			posnum="Voer een positienummer in"
			nopos="${red}Dat is geen geldige positie${NC}"
			surexit="Wil je je plaats zeker afstaan?"
			exitng="Je bent nu niet meer"
			posis="Je positie is:"
			enterops="Voer je operatie in"
			posinfo="Voer ${green}POS${NC}, dan je positienummer, en dan ${red}EXEC${NC} in"
			initialised="geïnitialiseerd. Voer het item in."
			corr="code correct"
			err="foute code"
			iteminfo="Voer ${green}ITEM${NC}, dan je positienummer, en dan ${red}EXEC${NC} in"
			opsinfo="Voer ${green}OPS${NC}, dan je positienummer, en dan ${red}EXEC${NC} in"
			break
			;;
		* | "+" | "HELP" )
			echo -e "${red}Pick a language:${NC}"
			echo -e "${red}Kies een taal:${NC}"
			echo -e "English: ${green}ITEM${NC}001"
			echo -e "Nederlands: ${green}ITEM${NC}002"
			;;
	esac
done

echo -e "$helpmess"

# get out of a position, press /999 to confirm
function newPos() {
	input "${red}$surexit${NC}" exitting

	if [[ $exitting == "/999" || $exitting == "ITEM999" ]]; then
		echo "$exitng $pos"
		exitting=true
	fi
}

# sets the position
function position() {
	pos="0"
	while [[ $pos == "0" ]]; do
		input "$posnum" position

		case $position in
			"-001" | "POS001" )
				pos="CMDR"
				;;
			"-002" | "POS002" )
				pos="PLT"
				;;
			"-003" | "POS003" )
				pos="FD"
				;;
			"-004" | "POS004" )
				pos="WXT"
				;;
			"-005" | "POS005" )
				pos="LD"
				;;
			"-006" | "POS006" )
				pos="ELSS"
				;;
			"-007" | "POS007" )
				pos="SSO"
				;;
			"-008" | "POS008" )
				pos="PAO"
				;;
			"+"  | "HELP" )
				echo -e "$posinfo"
				;;
			* )
				echo -e "$nopos"
				;;
		esac
		if [[ $pos != 0 ]]; then
			echo -e "$posis ${green}$pos${NC}"
		fi
	done
}

function CMDR() {
	input "$enterops" operation

	case $operation in
		"*001" | "OPS001" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item

				case $item in
					"/001" | "ITEM001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" | "HELP")
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" | "OPS999")
			newPos
			;;
		"+" )
			echo "$opsinfo"
			;;
	esac
}

function PLT() {
	input "$enterops" operation

	case $operation in
		"*001" | "OPS001" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item
				case $item in
					"/001" | "ITEM001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" | "HELP")
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" | "OPS999")
			newPos
			;;
		"+" )
			echo "$opsinfo"
			;;
	esac
}

function FD() {
	input "$enterops" operation

	case $operation in
		"*001" | "OPS001" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item
				case $item in
					"/001" | "ITEM001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" | "HELP")
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" | "OPS999")
			newPos
			;;
		"+" )
			echo "$opsinfo"
			;;
	esac
}

function WXT() {
	input "$enterops" operation

	case $operation in
		"*001" | "OPS001" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item
				case $item in
					"/001" | "ITEM001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" | "HELP")
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" | "OPS999")
			newPos
			;;
		"+" )
			echo "$opsinfo"
			;;
	esac
}

function LD() {
	input "$enterops" operation

	case $operation in
		"*001" | "OPS001" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item
				case $item in
					"/001" | "ITEM001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" | "HELP")
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" | "OPS999")
			newPos
			;;
		"+" )
			echo "$opsinfo"
			;;
	esac
}

function ELSS() {
	input "$enterops" operation

	case $operation in
		"*001" | "OPS001" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item
				case $item in
					"/001" | "ITEM001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" | "HELP")
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" | "OPS999")
			newPos
			;;
		"+" )
			echo "$opsinfo"
			;;
	esac
}

function SSO() {
	input "$enterops" operation

	case $operation in
		"*001" | "OPS001" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item
				case $item in
					"/001" | "ITEM001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" | "HELP")
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" | "OPS999")
			newPos
			;;
		"+" )
			echo "$opsinfo"
			;;
	esac
}

function PAO() {
	input "$enterops" operation

	case $operation in
		"*001" | "OPS001" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item
				case $item in
					"/001" | "ITEM001" )
						echo -e "${green}$corr${NC}"
						exits=1
						;;
					"+" | "HELP")
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		"*999" | "OPS999")
			newPos
			;;
		"+" )
			echo "$opsinfo"
			;;
	esac
}

# main method
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