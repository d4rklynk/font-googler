#!/bin/bash

CSS_FILE="Montserrat.css"
FONTS_DIR="Montserrat"
mkdir -p $FONTS_DIR

for url in $(grep -oE "https://fonts.gstatic.com/[^)]+" $CSS_FILE); do
    filename=$(basename "$url")
    filepath="$FONTS_DIR/$filename"
    curl -s "$url" -o "$filepath"
    sed -i "s|$url|$fonts_dir/$filename|g" "$CSS_FILE"
done
