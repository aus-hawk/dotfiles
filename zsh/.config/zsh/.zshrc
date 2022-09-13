# Run startx on login, only on VT1.
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi

source "$ZDOTDIR/env.zsh"
source "$ZDOTDIR/params.zsh"
source "$ZDOTDIR/options.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/functions.zsh"
source "$ZDOTDIR/prompt.zsh"
source "$ZDOTDIR/completion.zsh"
source "$ZDOTDIR/plugins.zsh"
