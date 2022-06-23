
output="  "

sinkV="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o -e " [0-9]\+%" | head -1)";
pactl get-sink-mute @DEFAULT_SINK@ | grep -q -e "yes" || output="$sinkV";

micV="$(pactl get-source-volume @DEFAULT_SOURCE@ | grep -o -e " [0-9]\+%" | head -1)";
pactl get-source-mute @DEFAULT_SOURCE@ | grep -q -e "yes" || output="$output $micV";

echo $output;

