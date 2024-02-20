#!/bin/bash

mkdir -p "$HOME/software"

sudo git clone --depth 1 "https://github.com/junegunn/fzf.git" "$HOME/software/fzf"

. "$HOME/software/fzf/install"

echo "[ -f ~/.fzf.bash ] && source ~/.fzf.bash" >> "$HOME/.bashrc"