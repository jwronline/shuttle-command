#!/bin/bash
clear
# colours
red='\033[0;31m'
green='\033[0;32m'
redblink='\033[5;41m'
blue='\033[01;34m'
NC='\033[0m'

# choosing input method
while [[ true ]]; do
	echo -e "choose your input method: "
	echo -e "kies je inputmethode: "
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
			iteminfo="Enter ${green}ITEM${NC}, your item number ${red}EXEC${NC}"
			opsinfo="Enter ${green}OPS${NC}, your operation number ${red}EXEC${NC}"
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
		echo -e "$exitng $pos"
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
			"+" | "HELP" )
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

#display a countdown of "argument" seconds
function countdown() {
 	seconds=$1
 	while [[ seconds -gt 0 ]]; do
		sleep 1
		printf "\r%02d" $seconds
		seconds=$(($seconds - 1))
	done
	echo
}

function CMDR() {
	input "$enterops" operation

	case $operation in
		### flight plan SPEC
		### reserve plan SPEC
		#OMS ignition 1 (CMDR checklist 4)
		"*008" | "OPS008" )
			level=1000 ###
			echo -e "OMS fuel level: ${green}$level${NC}" ###value?
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item

				case $item in
					"/301" | "ITEM301" )
						echo -e "OMS-1: ${green}on${NC}\nOMS-2: ${green}on${NC}\nOMS-3: ${green}on${NC}" ###
						exits=0
						;;
					"/474" | "ITEM474" )
						echo -e "starting OMS flight profile ${green}high${NC}" ###
						countdown 10
						echo -e "${green}OMS ignition${NC}" ###
						exits=1
						;;
					"/475" | "ITEM475" )
						echo -e "starting OMS flight profile ${green}normal${NC}" ###
						countdown 10
						echo -e "${green}OMS ignition${NC}" ###
						exits=1
						;;
					"/476" | "ITEM476" )
						echo -e "starting OMS flight profile ${green}low${NC}" ###
						countdown 10
						echo -e "${green}OMS ignition${NC}" ###
						exits=1
						;;
					"+" | "HELP" )
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		#set main flight plan
		"*777" | "OPS777" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item

				case $item in
					"/601" | "ITEM601" )
						echo -e "main flight plan: ${green}high${NC}" ###
						exits=0
						;;
					"/602" | "ITEM602" )
						echo -e "main flight plan: ${green}normal${NC}" ###
						exits=0
						;;
					"/603" | "ITEM603" )
						echo -e "main flight plan: ${green}low${NC}" ###
						exits=0
						;;
					"+" | "HELP" )
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			;;
		#set secondary flight plan
		"*778" | "OPS778" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item

				case $item in
					"/601" | "ITEM601" )
						echo -e "main flight plan: ${green}high${NC}" ###
						exits=0
						;;
					"/602" | "ITEM602" )
						echo -e "main flight plan: ${green}normal${NC}" ###
						exits=0
						;;
					"/603" | "ITEM603" )
						echo -e "main flight plan: ${green}low${NC}" ###
						exits=0
						;;
					"+" | "HELP" )
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			;;
		# change position
		"*999" | "OPS999" )
			newPos
			;;
		"+" | * )
			echo -e "$opsinfo"
			;;
	esac
}

function PLT() {
	input "$enterops" operation

	case $operation in
		# launch of satellite
		"*302" | "OPS302" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item
				case $item in
					#open sun shield
					"/179" | "ITEM179" )
						echo -e "Sun shield opened" ###
						;;
					#turn on spinning engines on satellite
					"/219" | "ITEM219" )
						echo -e "Engines: ${green}ON${NC}" ###
						;;
					#loose latches
					"/220" | "ITEM220" )
						echo -e "Latches opened" ###better formulation
						;;
					#launch satellite
					"/224" | "ITEM224" )
						echo -e "Satellite launched" ###better formulation
						;;
					"+" | "HELP" )
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		#OMS engines
		"*008" | "OPS008" )
			level=1000 ###
			echo -e "OMS fuel level: ${green}$level${NC}" ###value?
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item

				case $item in
					#OMS status
					"/301" | "ITEM301" )
						echo -e "OMS-1: ${green}on${NC}\nOMS-2: ${green}on${NC}\nOMS-3: ${green}on${NC}" ###
						exits=0
						;;
					#de-orbit
					"/478" | "ITEM4758" )
						echo -e "starting OMS flight profile ${green}de-orbit${NC}" ###
						countdown 10
						echo -e "${green}OMS ignition${NC}" ###
						exits=1
						;;
				esac
			done
			;;
		# change position
		"*999" | "OPS999" )
			newPos
			;;
		"+" | * )
			echo -e "$opsinfo"
			;;
	esac
}

function FD() {
	input "$enterops" operation

	case $operation in
		# abort advisory
		"*438" | "OPS438" )
			echo -e "${green}ABORT ADVISORY TEST${NC}" ### abort advisory
			echo -e "${redblink}ABORT${NC}" ###
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item
				case $item in
					"/439" | "ITEM439" )
						echo -e "${green}$corr${NC}"
						echo -e "${green}abort advisory test complete${NC}" ###
						exits=1
						;;
					"+" | "HELP" )
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		# change position
		"*999" | "OPS999" )
			newPos
			;;
		"+" | * )
			echo -e "$opsinfo"
			;;
	esac
}

function random() {
	awk 'BEGIN{
			min="'"$1"'"
			max="'"$2"'"
			srand()
			print int(rand()*(max-min)+min)
		}'
}

function emergencyWeather() {
	randomtemp1=$(random 15 30)
	randomhum1=$(random 5 50)
	randomwind1=$(random 0 50)

	randomtemp2=$(random 15 45)
	randomhum2=$(random 10 90)
	randomwind2=$(random 16 150)

	div="+----------------+---------------+-----------------------+---------------+---------------+"
	echo -e "$div"
	echo -e "| location\t | temperature\t | preciptitation\t | humidity\t | wind\t\t | "
	echo -e "$div"
	echo -e "| Dakar\t\t | $randomtemp1 °C\t | $randomhum1%\t\t\t | $randomhum1\t\t | ${randomwind1} km/h\t |"
	echo -e "$div"
	echo -e "| White Sands\t | $randomtemp2 °C\t | $randomhum2%\t\t\t | $randomhum2\t\t | ${randomwind2} km/h\t |"
	echo -e "$div"
}

function landingWeather() {
	randomtemp1=$(random 15 30)
	randomhum1=$(random 5 50)
	randomwind1=$(random 0 50)

	randomtemp2=$(random 20 35)
	randomhum2=$(random 10 40)
	randomwind2=$(random 16 50)

	randomtemp3=$(random 15 45)
	randomhum3=$(random 10 90)
	randomwind3=$(random 16 150)

	div="+----------------+---------------+-----------------------+---------------+---------------+"
	echo -e "$div"
	echo -e "| location\t | temperature\t | preciptitation\t | humidity\t | wind\t\t | "
	echo -e "$div"
	echo -e "| Kennedy\t | $randomtemp1 °C\t | $randomhum1%\t\t\t | $randomhum1\t\t | ${randomwind1} km/h\t |"
	echo -e "$div"
	echo -e "| Edwards\t | $randomtemp2 °C\t | $randomhum2%\t\t\t | $randomhum2\t\t | ${randomwind2} km/h\t |"
	echo -e "$div"
	echo -e "| White Sands\t | $randomtemp3 °C\t | $randomhum3%\t\t\t | $randomhum3\t\t | ${randomwind3} km/h\t |"
	echo -e "$div"
}

function WXT() {
	input "$enterops" operation

	case $operation in
		# weather report
		"*130" | "OPS130" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item
				case $item in
					# emergency landing
					"/642" | "ITEM642" )
						emergencyWeather
						exits=1
						;;
					# landing weather
					"/145" | "ITEM145" )
						landingWeather
						exits=0
						;;
					"+" | "HELP" )
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		# speed, altitude, position
		"*200" | "OPS200" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}tracking initialised${NC}. What do you want to track?" item ###
				case $item in
					# launch
					"/006" | "ITEM006" )
						velocity = "10 000 km / h" ###
						echo -e "velocity: ${green}$velocity" ###TO FIX
						;;
					"+" | "HELP" )
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			;;
		# change position
		"*999" | "OPS999" )
			newPos
			;;
		"+" | * )
			echo -e "$opsinfo"
			;;
	esac
}

function LD() {
	input "$enterops" operation

	case $operation in
		# pre-flight checks
		"*101" | "*101" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item
				case $item in
					"/001" | "ITEM001" )
						echo -e "" ###
						;;
				esac
			done
			;;
		"*137" | "OPS137" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item
				case $item in
					# audio
					"/137" | "ITEM137" )
						echo -e "${green}$corr${NC}"
						echo -e "${green}audio check complete${NC}" ###
						exits=1
						;;
					# abort advisory
					"/116" | "ITEM116" )
						echo -e "${green}$corr${NC}"
						echo -e "${green}abort advisory test complete${NC}" ###
						exits=1
						;;
					"+" | "HELP" )
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		# change position
		"*999" | "OPS999" )
			newPos
			;;
		"+" | * )
			echo -e "$opsinfo"
			;;
	esac
}

function ELSS() {
	input "$enterops" operation

	case $operation in
		#air pressure
		"*003" | "OPS003" )
			min=157
			max=177
			for (( i = 0; i < 10; i++ )); do
				min=$(($min+1))
				max=$(($max-1))
				pressure=$(random $min $max)
				pressure=${pressure:0:2}.${pressure:2:1}
				echo -e "cabin pressure: ${green}$pressure PSI${NC}" ###
				sleep 1
			done
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item
				case $item in
					"/136" | "ITEM136" )
						echo -e "${green}CABIN LEAK CHECK${NC}"
						exits=1
						;;
					"+" | "HELP" )
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		# retract launch arm
		"*140" | "OPS140" )
			echo -e "Retracting launch arm" ###
			exits=1
			;;
		# change position
		"*999" | "OPS999" )
			newPos
			;;
		"+" | * )
			echo -e "$opsinfo"
			;;
	esac
}

function SSO() {
	input "$enterops" operation

	case $operation in
		#APU operations
		"*183" | "OPS183" )
			exits=0
			while [[ $exits == 0 ]]; do
				input "${green}$operation${NC} $initialised" item
				case $item in
					"/162" | "ITEM162" )
						echo -e "${green}Shuttle on internal power supply${NC}" ###
						exits=1
						;;
					"+" | "HELP" )
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		# change position
		"*999" | "OPS999" )
			newPos
			;;
		"+" | * )
			echo -e "$opsinfo"
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
					"+" | "HELP" )
						echo -e "$iteminfo"
						;;
					* )
						echo -e "${red}$err${NC}"
						;;
				esac
			done
			exits=0
			;;
		# change position
		"*999" | "OPS999" )
			newPos
			;;
		"+" | * )
			echo -e "$opsinfo"
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
