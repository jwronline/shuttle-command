function emergencyWeather() { ###
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

function landingWeather() { ###
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
          "/624" | "ITEM624" )
            emergencyWeather
            exits=1
            ;;
          # landing weather
          "/320" | "ITEM320" )
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
            velocity="10 000 km / h" ###
            echo -e "velocity: ${green}$velocity" ###TO FIX
            ;;
          "/010" | "ITEM010" )
            dist="8000"
            while [[ $dist -ge 0 ]]; do
              dist=$(($dist - 80))
              echo -e "distance: $dist ft" ###
              sleep 2
            done
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
    # satellite tracking
    "*274" | "OPS274" )
      exits=0
      while [[ $exits == 0 ]]; do
        input "satellite tracking ${green}initialised${NC}." item ###
        case $item in
          # tracking
          "/320" | "ITEM320" )
            velocity="10m/s" ###
            distance="20m"
            echo -e "relative velocity: ${green}$velocity${NC}" ###TO FIX
            echo -e "distance: ${green}$distance${NC}"
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
