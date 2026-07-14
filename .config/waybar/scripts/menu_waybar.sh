# !/bin/sh 

CONFIG="$HOME/.config/waybar"
if [[ $1 = "-m" ]]; then 
  get=$(printf "waybar1\nwaybar2\nwaybar3\nclear\n" | fuzzel --dmenu)
fi

if pgrep waybar >/dev/null; then
    killall waybar
    sleep 1
fi

case "$get" in
  clear) 
  ;;
  waybar2) 
    waybar &
  ;;
  waybar3) waybar -c "$CONFIG/alt/config_alt1.jsonc" &
  ;;
  * | waybar1)
    waybar -c "$CONFIG/alt/config_alt.jsonc" -s "$CONFIG/alt/style_alt.css" &
  ;;
esac

