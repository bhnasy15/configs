
case "$1" in
  "clear")
    cleanup
    ;;
  "draw")
	  img2sixel "$2" -w "$3"
    ;;
  "video")
    [ ! -f "${PCACHE}.jpg" ] && \
    ffmpegthumbnailer -i "$4" -o "${PCACHE}.jpg" -s 0 -q 5
    image "${PCACHE}.jpg" "$width" "$height"
    ;;
  "pdf")
	  pdftoppm -jpeg -singlefile $2 | img2sixel -w $3
    ;;
  "audio")
    [ ! -f "${PCACHE}.jpg" ] && \
    ffmpeg -i "$image_file" "${PCACHE}.jpg" -y >/dev/null
    image "${PCACHE}.jpg" "$width" "$height"
    ;;
  *)
esac
