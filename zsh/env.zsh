typeset -U path # prevent duplicate entries in path
export path=("$HOME/.local/bin" $path)

export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export MANWIDTH=80
export MANPAGER="sh -c 'col -bx | bat -l man -p --theme=Nord'"
export MANROFFOPT="-c"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export LESSHISTFILE="-"

export PYTHONSTARTUP="$HOME/.config/python/startup.py"
