#!/bin/bash
content=$(xclip -selection clipboard -o) || exit 1
[[ -n $content ]] || exit 0

length=${#content}
escaped=$(printf '%s' "$content" | sed ':a;N;$!ba;s/\n/\\n/g')

file="$HOME/.clipboard"
entry="$length $escaped"

touch "$file"

if ! grep -Fxq -- "$entry" "$file"; then
    printf '%s\n' "$entry" >> "$file"
fi
