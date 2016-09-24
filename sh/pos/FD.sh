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
      ;;
    # check for on-orbit
    "*016" | "OPS016" )
      echo -e "${green}on-orbit operations${NC}" ### abort advisory
      exits=0
      while [[ $exits == 0 ]]; do
        input "${green}$operation${NC} $initialised" item
        case $item in
          "/080" | "ITEM080" )
            echo -e "${green}beginning check${NC}" ###
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
