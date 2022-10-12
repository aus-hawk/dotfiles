current-git-branch() {
    if git rev-parse 2>/dev/null; then
        info=" $(git branch --show-current)"
        if [[ $(git status --porcelain) ]]; then
            info="$info *"
        fi
        echo "$info"
    fi
}

build-prompt() {
    echo

    p="[%F{4}%n%f@%F{4}%m%f]"
    p="$p [%F{3}%~%f]"
    g="$(current-git-branch)"
    if [[ $g ]]; then
        p="$p [%F{2}$g%f]"
    fi
    p="$p%(?.. [%F{1}%?%f])"
    echo "$p"

    echo ":: "
}

PROMPT='$(build-prompt)'
