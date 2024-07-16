#!/bin/sh
if sketchybar --query bar | grep -q '"hidden": "on"'; then
    sketchybar --bar hidden=off;
else
    sketchybar --bar hidden=on;
fi
