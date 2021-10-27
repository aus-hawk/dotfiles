# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### My Configs

## Preconfigs
# startx on login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
fi

## Environment Variables
# Add ~/bin to $PATH if it exists
if [ -d "${HOME}/local/bin" ]; then
	PATH="${HOME}/local/bin:${PATH}"
fi

## Prompts
PROMPT='
%F{1}%n%f@%F{4}%m%f %F{6}%B%~%b%f
%F{2}%#%f '
RPROMPT='%(?..[%?])'

## Aliases
if [ -e $HOME/.zsh_alias ]; then
	. $HOME/.zsh_alias
fi

## Functions
if [ -e $HOME/.zsh_func ]; then
	. $HOME/.zsh_func
fi
