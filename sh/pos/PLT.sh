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
          "+" | "HELP" )
            echo -e "$iteminfo"
            ;;
          * )
            echo -e "${red}$err${NC}"
            ;;
        esac
      done
      ;;
    # OMS thrust level
    "*005" | "OPS005" )
      ###
      thrust="10%" ###
      echo -e "thrust: $thrust" ###
      exits=0
      while [[ $exits == 0 ]]; do
        input "${green}$operation${NC} $initialised" item

        case $item in
          "/620" | "ITEM620" )
            echo -e "thrust reduced" ###
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
    # prox ops
    "*190" | "OPS190" )
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
