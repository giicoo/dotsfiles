#!/bin/bash
sleep 3
set_morning() {
    hyprctl hyprpaper wallpaper eDP-1,~/.wallpaper/tuman.jpg
}

set_aftermoon() {
    hyprctl hyprpaper wallpaper eDP-1,~/.wallpaper/stalinki_orange.png
}

set_night() {
    hyprctl hyprpaper wallpaper eDP-1,~/.wallpaper/tuman_temno.png
}

while true; do
    
    current_date_time="`date "+%H"`";
  
    if [[  ($current_date_time > "10") && ($current_date_time < "15")]]
    then
        set_morning
    elif [[ ($current_date_time > "14") && ($current_date_time < "20") ]]
    then
        set_aftermoon
    else 
        set_night
    fi
    sleep 600
done
