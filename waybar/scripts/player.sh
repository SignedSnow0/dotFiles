#!/usr/bin/env bash

title_length=20

p_status=$(playerctl --player=spotify status 2> /dev/null)
if [[ $p_status == "Paused" ]]; then
    percentage=0
    class="pause"
elif [[ $p_status == "Playing" ]]; then
    percentage=100
    class="play"
else
    echo "{\"text\": \"\", \"alt\": \"\", \"tooltip\": \"\", \"class\": \"stop\"}"
    exit 0
fi

time=$(date +%s)
offset=$(( time % title_length ))
end=$(( title_length + offset ))

title=$(playerctl --player=spotify metadata --format '{{artist}} - {{title}}')
tmp="${title} ${title}"
trimmed_title=${tmp:$offset:title_length}

time=$(playerctl --player=spotify metadata --format '{{duration(position)}}/{{duration(mpris:length)}}')

text="<span foreground=\\\"#1ed760\\\">$trimmed_title</span> $time"
tooltip="$title\n$time"
class="$class"
percentage="$percentage"

echo "{\"text\": \"$text\", \"alt\": \"$class\", \"tooltip\": \"$tooltip\", \"class\": \"$class\" }"
