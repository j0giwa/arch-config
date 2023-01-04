# ~/.bashrc

[[ $- != *i* ]] && return

stty -ixon
shopt -s autocd

# === History ====
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE= HISTFILESIZE= # infinite

# === Aliases ===

# == Rename Commands   ==
alias open='xdg-open'
alias yay='paru'
alias top='htop'
alias notepad++='notepadqq'
alias lampp='sudo /opt/lampp/lampp start'

# ==  Default Flag Override  ==
alias ls='ls -CFhN --color=auto --group-directories-first'
alias la='ls -A'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias curl="curl --user-agent 'noleak'"
alias wget="wget -c --user-agent 'noleak' --hsts-file='$XDG_DATA_HOME/wget-hsts'"
alias startx='startx "$XDG_CONFIG_HOME/X11/xinitrc" -- "$XDG_CONFIG_HOME/X11/xserverrc" vt1'
alias mysql-workbench='mysql-workbench --configdir="$XDG_DATA_HOME/mysql/workbench"'
alias netbeans='netbeans --userdir "${XDG_CONFIG_HOME}"/netbeans'
alias emacs="emacsclient -c -a 'emacs'"
alias grep="grep --color=auto"

# == Shorthands  ==
alias null='/dev/null'
alias htdocs='cd /opt/lampp/htdocs'
alias python='python3'

# === Prompt ===

PS1='[\u@\h \W]\$ '
PS2='> '
eval "$(starship init bash)"
#eval "$(thefuck --alias)"
#eval "$(thefuck --alias FUCK)"

# Autostart

# emacs deamon
#pgrep -x emacs > /dev/null || /usr/bin/emacs --daemon &

# Display random Pokemon
pokemon-colorscripts --random
alias config='/usr/bin/git --git-dir=$HOME/Documents/Projekte/arch-config/ --work-tree=$HOME'
