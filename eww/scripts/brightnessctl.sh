#!/bin/bash

up() {
    brightnessctl set 5%+
}

down() {
    brightnessctl set 5%-
}

get() {
    brightnessctl g
}

if [[ "$1" == "--up" ]]; then
	up
elif [[ "$1" == "--down" ]]; then
	down
else
	get
fi