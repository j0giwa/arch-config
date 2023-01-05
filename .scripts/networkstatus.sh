#!/bin/sh

nmcli g | awk 'NR == 2 {print $1}'
