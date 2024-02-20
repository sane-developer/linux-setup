#!/bin/bash

cd "$HOME"

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh > "zoxide_setup.sh"

chmod +x "zoxide_setup.sh"

sudo "zoxide_setup.sh"

rm -f "zoxide_setup.sh"

append "eval '$(zoxide init --cmd cd bash)'" ".bashrc"

echo "Successfully installed Zoxide..."
