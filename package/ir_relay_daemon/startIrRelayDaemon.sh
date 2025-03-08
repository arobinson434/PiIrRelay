#!/bin/sh

RELAY_NAME="Living Room"
RELAY_DESCRIPTION="Relay in the Living Room"

# Wait for a default route via wifi
while ! grep -Eq "wlan0\s+00000000" /proc/net/route; do
    sleep 1
done

IrRelayDaemon --name "$RELAY_NAME" --description "$RELAY_DESCRIPTION"
