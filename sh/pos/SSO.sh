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
    # trajectory
    "*200" | "OPS200" )
      ###
      echo -e "   ^ "
      echo -e "   |                         * "
      echo -e " h |               * "
      echo -e " e |          ${green}*${NC} "
      echo -e " i |      ${green}*${NC} "
      echo -e " g |   ${green}*${NC} "
      echo -e " h | ${green}*${NC} "
      echo -e " t |${green}*${NC} "
      echo -e "   +----------------------------------> "
      echo -e "             downrange "
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
