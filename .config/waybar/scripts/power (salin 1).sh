#!/bin/sh

if [[ $1 = "-i" ]]; then 
  profile=$(powerprofilesctl get)

  case "$profile" in
      performance)
         echo '{"text":"","class":"performance"}'
         ;;
     balanced)
         echo '{"text":"","class":"balanced"}'
         ;;
     power-saver)
         echo '{"text":"","class":"power-saver"}'
         ;;
  esac
elif [[ $1 = "-m" ]]; then
  get=$(printf "performance\nbalanced\npower-saver\n" | fuzzel --dmenu)

  [ -n "$get" ] && powerprofilesctl set "$get"
fi
