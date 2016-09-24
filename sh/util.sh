# random number between two
# $1 minimum
# $2 maximum
function random() {
  awk 'BEGIN{
      min="'"$1"'"
      max="'"$2"'"
      srand()
      print int(rand()*(max-min)+min)
    }'
}

# display a countdown of "argument" seconds
function countdown() {
  seconds=$1
  while [[ seconds -gt 0 ]]; do
    sleep 1
    printf "\r%02d" $seconds
    seconds=$(($seconds - 1))
  done
  echo
}

# get out of a position, press /999 to confirm
function newPos() {
  input "${red}$surexit${NC}" exiting

  if [[ $exiting == "/999" || $exiting == "ITEM999" ]]; then
    echo -e "$exitng $pos"
    exiting=true
  fi
}
