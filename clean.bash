#!/bin/bash
file="$HOME/.clipboard"

[ ! -f "$file" ] && touch "$file"

echo -n > $file
