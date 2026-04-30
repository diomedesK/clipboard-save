#!/bin/bash
clipboard_file="$HOME/.clipboard"

[ ! -f "$clipboard_file" ] && touch "$clipboard_file"

chosen=$(awk '{
    space = index($0, " ")
    len = substr($0, 1, space - 1) + 0
    content = substr($0, space + 1, len)
    print content
}' "$clipboard_file" | rofi -dmenu -p "Clipboard")

[ -n "$chosen" ] && printf '%b' "$chosen" | xclip -selection clipboard
