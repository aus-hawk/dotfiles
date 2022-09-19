# ls
alias ls="ls --color=auto -F"
alias ll="ls -Al"

# mkdir
alias mkdir="mkdir -pv"

# grep
alias grep="grep -ns --color=auto"
alias todo="grep -e TODO -e FIXME"

# dotfile
alias dotfile="stow -v --no-folding -t $HOME -d $HOME/dotfiles"
alias dotfile-test="dotfile -n"

# cat
alias cat="bat --theme='Nord'"

# vim
alias v=nvim
