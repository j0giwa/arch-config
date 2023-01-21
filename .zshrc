#!/usr/bin/env zsh

# Useless eycandy
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b " #fallback
pokemon-colorscripts --random
eval "$(starship init zsh)"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Rename Commands
alias open='xdg-open'
alias yay='paru'
alias top='htop'
alias notepad++='notepadqq'
alias lampp='sudo /opt/lampp/lampp start'

# Default Flag Override
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

# Shorthands
alias null='/dev/null'
alias htdocs='cd /opt/lampp/htdocs'
alias python='python3'
alias yta='youtube-dl -x --audio-format mp3 --audio-quality 0'


# == Custom Commands
alias config='/usr/bin/git --git-dir=$HOME/Documents/projekte/arch-config/ --work-tree=$HOME'

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

