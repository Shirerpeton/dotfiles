#!/bin/bash

theme=$(flavours current)
echo "$theme" >> ~/.local/scripts/flavours-themes.txt

#making sure themes are unique
lines=$(sort ~/.local/scripts/flavours-themes.txt | uniq)
echo "$lines" > ~/.local/scripts/flavours-themes.txt
