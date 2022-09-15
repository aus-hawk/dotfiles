maybe-source() {
	[[ -f "$1" ]] && source "$1"
}

load-plugin() {
	mkdir "$XDG_DATA_HOME/zsh/plugins"
	plugin=$(echo $1 | cut -f 2 -d "/")
	plugin_folder="$XDG_DATA_HOME/zsh/plugins/$plugin"
	if [[ ! -d "$plugin_folder" ]]; then
		git clone --depth 1 "https://github.com/$1" "$plugin_folder"
	fi
	maybe-source "$plugin_folder/$plugin.zsh" || \
		maybe-source "$plugin_folder/$plugin.plugin.zsh" || \
		echo "Can't load plugin $plugin."
}

update-plugins() {
	for plugin in "$XDG_DATA_HOME"/zsh/plugins/*; do
		pushd $plugin > /dev/null
		echo Updating $(echo $plugin | awk -F "/" '{print $NF}')...
		git pull --depth 1
		popd > /dev/null
		echo
	done
}

load-plugin "zsh-users/zsh-autosuggestions"
load-plugin "hlissner/zsh-autopair"

# Syntax highlighting should always be loaded last.
load-plugin "zsh-users/zsh-syntax-highlighting"
