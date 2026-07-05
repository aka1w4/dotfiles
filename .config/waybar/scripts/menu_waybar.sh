# !/bin/sh 

get=$(printf "waybar1\nwaybar2\n" | fuzzel --dmenu)

if pgrep waybar >/dev/null; then
    killall waybar
    sleep 1
fi

CONFIG="$HOME/.config/waybar"

case "$get" in
  waybar1) 
    waybar &
  ;;
  waybar2) 
    waybar -c "$CONFIG/alt/config_alt.jsonc" -s "$CONFIG/alt/style_alt.css" &
  ;;
  *) 
    waybar &
  ;;
esac

