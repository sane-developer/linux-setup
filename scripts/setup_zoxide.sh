#!/bin/bash

cd "$HOME"

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh > "$HOME/zoxide_setup.sh"

chmod +x "$HOME/zoxide_setup.sh"

run_script "$HOME/zoxide_setup.sh"

rm -f "$HOME/zoxide_setup.sh"

append "eval '$(zoxide init --cmd cd bash)'" "$HOME/.bashrc"

echo "Successfully installed Zoxide..."
