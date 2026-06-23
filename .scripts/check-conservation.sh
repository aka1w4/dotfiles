MODE=$(cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)

if [ "$MODE" = "1" ]; then
    notify-send "Conservation Mode" "ON"
else
    notify-send "Conservation Mode" "OFF - cek sistem"
fi
