#!/bin/bash

[ -d "$HOME/.cache/vifm" ] || mkdir -p "$HOME/.cache/vifm"

action="$1"
panel_width=$2
panel_height=$3
cell_width=6
cell_height=14
width=$((panel_width*cell_width))
height=$((panel_height*cell_height))
image_file="$4"
background=black

PCACHE="$HOME/.cache/vifm/thumbnail.$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$PWD/$image_file")" | sha256sum | awk '{print $1}')"

cleanup() {
    printf '\33[s\33[5A\33[2K\33[u'
    clear
    exit 0
}

# recieves image with height
image() {
    #montage "$1" -background "$background" -geometry "${2}x${3}" sixel:-
		[ $height -le $width ] && img2sixel "$1" -w auto -h $height -q low || img2sixel "$1" -w $width -h auto -q low
  }


case "$action" in
  "clear")
    cleanup
    ;;
  "draw")
    [ ! -f "${PCACHE}.jpg" ] && convert "$image_file"'[0]' "${PCACHE}.jpg"
    # FILE="$PWD/$image_file"
    image "${PCACHE}.jpg" "$width" "$height"
    ;;
  "video")
    [ ! -f "${PCACHE}.jpg" ] && \
    ffmpegthumbnailer -i "$4" -o "${PCACHE}.jpg" -s 0 -q 5
    image "${PCACHE}.jpg" "$width" "$height"
    ;;
  "pdf")
    [ ! -f "${PCACHE}.jpg" ] && \
    pdftoppm -jpeg -f 1 -singlefile "$image_file" "$PCACHE"
    image "${PCACHE}.jpg" "$width" "$height"
    ;;
  *)
esac
