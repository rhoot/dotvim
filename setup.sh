#!/bin/bash -e

script_dir="$(dirname "$(readlink -f "$0")")"

add_symlink() {
	local target="$1"
	local link="$2"

	if [ -h "$link" ]; then
		rm "$link"
	fi

	if [ -e "$link" ]; then
		printf "\033[31mERR: '%s' exists and would be overwritten\033[0m\n" "$link" > /dev/stderr
	fi

	ln -s "$target" "$link"
}

mkdir -p ~/.config
mkdir -p ~/.local/share/fonts

add_symlink "$script_dir/nvim" ~/.config/nvim
add_symlink "$script_dir/vimrc" ~/.vimrc
add_symlink "$script_dir/gvimrc" ~/.gvimrc

rsync -r "$script_dir/fonts/" ~/.local/share/fonts

