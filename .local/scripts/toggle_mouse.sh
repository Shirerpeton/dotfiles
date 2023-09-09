#!/usr/bin/bash

MOUSE_ID="USB Optical Mouse"
MOUSE_STATUS=$(xinput list-props "USB Optical Mouse" | grep "Device Enabled" | awk '{print $4}')

if [ "$MOUSE_STATUS" == "1" ]; then
    xinput disable "$MOUSE_ID"
else
    xinput enable "$MOUSE_ID"
fi
