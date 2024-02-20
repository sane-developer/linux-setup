#!/bin/bash

mkdir -p "$HOME/software"

clone "https://github.com/junegunn/fzf.git" "$HOME/software/fzf"

run "$HOME/software/fzf/install"

append "[ -f ~/.fzf.bash ] && source ~/.fzf.bash" "$config_file"
