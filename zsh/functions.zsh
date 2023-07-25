# gitignore generator
gi() {
    typeset IFS=,
    curl --silent --location "https://www.toptal.com/developers/gitignore/api/$*"
}
