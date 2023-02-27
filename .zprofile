#!/usr/bin/env zsh

# ==== Default Programms ====
export EDITOR="vim"
export TERMINAL="st"
export COLORTERM=truecolor
export BROWSER="firefox"
export PAGER="most"

path+=$HOME/.emacs.d/bin
path+=$HOME/.local/bin
path+=$HOME/.local/bin/bar
path+=$HOME/.spicetify
export PATH

# ==== XDG ====
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# Cleanup
export HISTFILE="${XDG_STATE_HOME}/zsh/history"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
#export DOOMDIR="$XDG_CONFIG_HOME/doom"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export VSCODE_PORTABLE="$XDG_DATA_HOME/vscode"
export GKT_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GKT2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export LESSHISTFILE="-" #Disable file
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export KDEHOME="$XDG_CONFIG_HOME/kde"
