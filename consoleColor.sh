#!/usr/bin/env bash

declare -A colorMap
declare -A styleMap

colorMap[default]=0
colorMap[black]=30
colorMap[red]=31
colorMap[green]=32
colorMap[yellow]=33
colorMap[blue]=34
colorMap[magenta]=35
colorMap[cyan]=36
colorMap[grey]=37

styleMap[bold]=1
styleMap[dim]=2
styleMap[underlined]=4
styleMap[blink]=5
styleMap[inverted]=7
styleMap[hidden]=8

setParams() {
    local -n localColor=$1
    shift

    local -n localStyle=$1
    shift

    local -n localText=$1
    shift

    while [ -n "$1" ]; do # while loop starts
        case "$1" in
        -c)
            localColor="\e[${colorMap[$2]}m"
            shift
            ;;
        -s)
            localStyle="\e[${styleMap[$2]}m"
            shift
            ;;
        --)
            shift # The double dash makes them parameters

            break
            ;;
        *)
            localText="$*\e[${colorMap[default]}m"
            break
            ;;
        esac

        shift
    done
}

color() {
    local selectedColor
    local selectedStyle
    local text
    
    setParams selectedColor selectedStyle text $@

    echo "$selectedStyle$selectedColor$text"
}