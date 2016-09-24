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
