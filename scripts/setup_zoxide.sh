#!/bin/bash

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh > "$HOME/zoxide_setup.sh"

chmod +x "zoxide_setup.sh"

run "zoxide_setup.sh"

rm -f "zoxide_setup.sh"

append "eval '$(zoxide init --cmd cd bash)'" "$config_file"
