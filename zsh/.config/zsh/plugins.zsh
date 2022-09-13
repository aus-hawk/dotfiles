load-plugin() {
	mkdir "$XDG_DATA_HOME/zsh/plugins"
	plugin=$(echo $1 | cut -f 2 -d "/")
	plugin_folder="$XDG_DATA_HOME/zsh/plugins/$plugin"
	if [[ ! -d "$plugin_folder" ]]; then
		git clone --depth 1 "https://github.com/$1" "$plugin_folder"
	fi
	source "$plugin_folder/$plugin.zsh"
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
load-plugin "zsh-users/zsh-syntax-highlighting"
