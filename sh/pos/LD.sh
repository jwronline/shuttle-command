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
            echo -e "countdown resumed" ###
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
      ;;
    # satellite activation
    "/987" | "ITEM987" )
      echo -e "satellite ${green}activated${NC}" ###
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
