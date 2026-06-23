#!/bin/sh
set +e
for c in /proc/asound/card*; do
  CARD=$(basename "$c" | sed 's/card//')
  amixer -c "$CARD" set 'Internal Mic Boost' 0 >/dev/null 2>&1
  amixer -c "$CARD" set 'Headset Mic Boost' 0 >/dev/null 2>&1
  amixer -c "$CARD" set 'Capture' 50% >/dev/null 2>&1
done
exit 0
