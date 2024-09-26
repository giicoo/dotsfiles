#!/bin/bash

# Get Volume
get_volume() {
	status=`wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d " " -f 3`

	if [[ "$status" == "" ]]; then
		volume=`wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d " " -f 2`
		echo "$volume"
	else
		echo "Mute"
	fi
}

# Get icons
get_icon() {
	vol=""
	current="$(get_volume)"
	status=`wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d " " -f 3`
	if [[ "$status" == "" ]]; then
		if [[ "$current" == "0.00" ]]; then
			echo ""
		elif [[ ("$current" > "0") && ("$current" < "0.50") || ("$current" == "0.50") ]]; then
			echo ""
		elif [[ ("$current" > "0.50") && ("$current" < "1") || ("$current" == "1.00") ]]; then
			echo "🔊"
		fi
	else
		echo " "
	fi
}

# Increase Volume
inc_volume() {
	wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
}

# Decrease Volume
dec_volume() {
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
}

# Toggle Mute
toggle_mute() {
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
	get_volume
elif [[ "$1" == "--icon" ]]; then
	get_icon
elif [[ "$1" == "--up" ]]; then
	inc_volume
elif [[ "$1" == "--down" ]]; then
	dec_volume
elif [[ "$1" == "--mute" ]]; then
	toggle_mute
else
	get_volume
fi