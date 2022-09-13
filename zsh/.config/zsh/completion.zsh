autoload -Uz compinit
zstyle ":completion:*" ignore-parents parent pwd ..
zstyle ":completion:*" list-colors ""
zstyle ":completion:*" menu select interactive search
zstyle ":completion:*" verbose true
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
