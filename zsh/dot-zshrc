source "$ZDOTDIR/env.zsh"
source "$ZDOTDIR/params.zsh"
source "$ZDOTDIR/options.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/functions.zsh"
source "$ZDOTDIR/prompt.zsh"
source "$ZDOTDIR/completion.zsh"
source "$ZDOTDIR/plugins.zsh"

if [ -z "$DISPLAY" ]; then
    # Run startx on login, only on VT1.
    if [ "$XDG_VTNR" -eq 1 ]; then
        exec startx "$XINITRC"
    elif [ "$TERM" = "linux" ]; then
        source "$ZDOTDIR/ttythemes/nord.zsh"
        clear
    fi
fi
