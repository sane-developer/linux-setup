#!/bin/bash

mkdir -p "$HOME/software"

clone "https://github.com/junegunn/fzf.git" "$HOME/software/fzf"

cd "$HOME/software/fzf"

sudo "install"

append "[ -f ~/.fzf.bash ] && source ~/.fzf.bash" "$config_file"
