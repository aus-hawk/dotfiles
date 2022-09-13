# ls
alias ls="ls --color=auto -F"
alias ll="ls -Al"

# mkdir
alias mkdir="mkdir -pv"

# rm
alias rm="rm -I --preserve-root"

# grep
alias grep="grep -ns --color=auto"
alias egrep="egrep -ns --color=auto"
alias fgrep="fgrep -ns --color=auto"
alias todo="grep -ns -e TODO -e FIXME"

# dotfile
alias dotfile="stow -v --no-folding -t $HOME -d $HOME/dotfiles"
alias dotfile-test="dotfile -n"

# cat
alias cat="bat --theme='Nord'"

# vim
alias v=nvim
