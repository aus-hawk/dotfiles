# ls
alias ls="ls --color=auto"
alias ll="ls -AFl"

# grep
alias grep="grep --color=auto"
alias cgrep="grep -ns"
alias todo="cgrep -e TODO -e FIXME"

# dotfile
alias dotfile="stow -v --no-folding -t $HOME -d $HOME/dotfiles"
alias dotfile-test="dotfile -n"

# cat
alias cat="bat --theme='Nord'"

# vim
alias v=nvim
