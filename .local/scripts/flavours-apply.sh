#!/bin/bash

themesStr=$(flavours list)
theme=$(awk -v seed=$RANDOM '{n=split($0, themes, " ")} END{srand(seed); pint n; print themes[int(rand()*n + 1)]}' <<< "$themesStr")
echo "applying $theme theme"
flavours apply $theme
