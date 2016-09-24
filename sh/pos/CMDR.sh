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
    # OMS disabling
    "*001" | "OPS001" )
      exits=0
      while [[ $exits == 0 ]]; do
        input "${green}$operation${NC} $initialised" item

        case $item in
          #disable OMS engines
          "/303" | "ITEM303" )
            exits=1
            sleep 1
            echo -e "OMS-1: ${red}disabled${NC}" ###
            sleep 0.1
            echo -e "OMS-2: ${red}disabled${NC}" ###
            sleep 0.1
            echo -e "OMS-3: ${red}disabled${NC}" ###
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
    # pre-launch satellite
    "*320" | "OPS320" )
      exits=0
      while [[ $exits == 0 ]]; do
        input "${green}$operation${NC} $initialised" item

        case $item in
          #preparation
          "/491" | "ITEM491" )
            echo -e "preparing satellite launch" ###
            ;;
          # removal maneuver
          "/549" | "ITEM549" )
            echo -e "removal maneuver" ###
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
    # OMS fuel level
    "*003" | "OPS003" )
      exits=0
      while [[ $exits == 0 ]]; do
        input "${green}$operation${NC} $initialised" item

        case $item in
          # OMS fuel level
          "/008" | "ITEM008" )
            oms="40%"
            echo -e "OMS fuel level:$oms" ###
            ;;
          # RCS fuel level
          "/009" | "ITEM009" )
            rcs="60%"
            echo -e "RCS fuel level:$rcs" ###
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
