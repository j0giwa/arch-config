#!/bin/sh

echo "NET: $(nmcli d | awk 'NR == 2 {print $4}')"
