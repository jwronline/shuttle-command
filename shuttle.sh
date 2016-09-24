#!/bin/bash

. ./sh/init.sh

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

. ./sh/util.sh

. ./sh/pos/CMDR.sh
. ./sh/pos/PLT.sh
. ./sh/pos/FD.sh
. ./sh/pos/WXT.sh
. ./sh/pos/LD.sh
. ./sh/pos/ELSS.sh
. ./sh/pos/SSO.sh
. ./sh/pos/PAO.sh

# main method
while [[ true ]]; do
	position
	while [[ $exiting != true ]]; do
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
	exiting=false
done
