#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar (depending on multiple monitors or not)
if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload example &
	done
else
    	polybar --reload example &
fi

# Launch bar1 and bar2
polybar example &


echo "Bars launched..."
