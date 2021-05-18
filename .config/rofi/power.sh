#!/usr/bin/env bash
rofi_command="rofi -theme ./apps.rasi"

current=$(sudo ryzenadj --info | grep apu-slow-limit | awk '{print $6/1}')     

# Links
silent=""
cool=""
fine=""
hot=""
performance=""

# Variable passed to rofi
options="$silent\n$cool\n$fine\n$hot\n$performance"

chosen="$(echo -e "$options" | $rofi_command -p "        $current W" -dmenu -selected-row 0)"

case $chosen in

  $silent)
    sudo ryzenadj --stapm-limit=5000 --fast-limit=5000 --slow-limit=5000 --apu-slow-limit=5000
    ;;
  $cool)

    sudo ryzenadj --stapm-limit=10000 --fast-limit=10000 --slow-limit=10000 --apu-slow-limit=10000
    ;;
  $fine)
    sudo ryzenadj --stapm-limit=15000 --fast-limit=15000 --slow-limit=15000 --apu-slow-limit=15000
    ;;
  $hot)
    sudo ryzenadj --stapm-limit=30000 --fast-limit=30000 --slow-limit=30000 --apu-slow-limit=30000
    ;;
  $performance)
    sudo ryzenadj --stapm-limit=40000 --fast-limit=40000 --slow-limit=40000 --apu-slow-limit=40000
    ;;
esac
