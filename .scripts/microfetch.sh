#!/bin/bash

## INFO
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(pacman -Q | wc -l)"
orphans="$(pacman -Qtdq | wc -l)"
terminal="$(echo $TERM)"
shell="$(basename "${SHELL}")"

## DEFINE COLORS
if [ -x "$(command -v tput)" ]; then
    bold="$(tput bold)"
    blue="$(tput setaf 4)"
    white="$(tput setaf 7)"
    reset="$(tput sgr0)"
fi

# you can change these
lc="${reset}${bold}${blue}"         # labels
nc="${reset}${bold}${blue}"         # user and hostname
ic="${reset}${white}"               # info
c0="${reset}${blue}"                # first color

# Clear terminal because it looks better
clear

## OUTPUT
cat <<EOF

${c0}                   ▄                   ${reset}
${c0}                  ▟█▙                  ${reset}
${c0}                 ▟███▙                 ${reset}
${c0}                ▟█████▙                ${reset}
${c0}               ▟███████▙               ${reset}
${c0}              ▂▔▀▜██████▙              ${reset}
${c0}             ▟██▅▂▝▜█████▙             ${reset}
${c0}            ▟█████████████▙            ${lc}OS:        ${ic}Arch btw ...${reset}
${c0}           ▟███████████████▙           ${lc}KERNEL:    ${ic}${kernel}${reset}
${c0}          ▟█████████████████▙          ${lc}UPTIME:    ${ic}${uptime}${reset}
${c0}         ▟███████████████████▙         ${lc}PACKAGES:  ${ic}${packages} [Repo/Aur] (${orphans} orphans)${reset}
${c0}        ▟█████████▛▀▀▜████████▙        ${lc}TERMINAL:  ${ic}${terminal}${reset}
${c0}       ▟████████▛      ▜███████▙       ${lc}SHELL:     ${ic}${shell}${reset}
${c0}      ▟█████████        ████████▙      ${reset}
${c0}     ▟██████████        █████▆▅▄▃▂     ${reset}
${c0}    ▟██████████▛        ▜█████████▙    ${reset}
${c0}   ▟██████▀▀▀              ▀▀██████▙   ${reset}
${c0}  ▟███▀▘                       ▝▀███▙  ${reset}
${c0} ▟▛▀                               ▀▜▙ ${reset}

EOF
