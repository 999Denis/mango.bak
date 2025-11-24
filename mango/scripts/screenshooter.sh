#!/bin/sh
grim -g "$(slurp)" -t png - | satty --filename - --output-filename ~/Pictures/Screenshots/screenshot-$(date +%Y%m%d-%H%M%S)-annotated.png --actions-on-escape="save-to-clipboard,exit"