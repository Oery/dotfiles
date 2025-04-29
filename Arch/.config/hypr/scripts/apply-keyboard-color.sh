#!/usr/bin/env bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
RAZER_DEVICE="/sys/bus/hid/drivers/razerkbd/0003:1532:02A5.000F/matrix_effect_static"

hex_to_binary() {
    # Remove '#' if present
    local hex=${1#"#"}

    # Convert hex to RGB values
    local r=$(printf "%d" 0x${hex:0:2})
    local g=$(printf "%d" 0x${hex:2:2})
    local b=$(printf "%d" 0x${hex:4:2})
    
    # Output binary format
    printf "\x${hex:0:2}\x${hex:2:2}\x${hex:4:2}"
}

COLOR_HEX=$(cat "$XDG_CONFIG_HOME/wallust/colors.conf")
hex_to_binary "$COLOR_HEX" > "$RAZER_DEVICE"
