#!/bin/bash

# Read sensors
# Extract third line after line containing 'asas-isa-0000'
# Get the temperature in degrees Celsius
temp="$(sensors | awk 'c&&!--c;/asus-isa-0000/{c=3}' | sed 's/temp1: *.//; s/[^0-9].*//')"

if [ "$temp" -lt "60" ]; then
    echo "${temp}°C"
else
    echo "<span color='red'>${temp}°C</span>"
fi
