# gitignore generator
gi() {
    typeset IFS=,
    curl -sL "https://www.toptal.com/developers/gitignore/api/$*"
}
