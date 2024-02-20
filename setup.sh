#!/bin/bash

append() {
  sudo echo "$1" >> "$2"
}

run_script() {
  sudo "$1" 
}

install() {
  sudo apt-get install -q -y "$1" > /dev/null 2>&1
  
  if [ $? -eq 0 ]; then
    echo "Successfully installed $1"
  fi
}

clone() {
  sudo git clone --depth 1 "$1" "$2" > /dev/null 2>&1
  
  if [ $? -eq 0 ]; then
    echo "Successfully cloned $1 to $2"
  fi
}

update() {
  sudo apt-get update > /dev/null 2>&1
 
  if [ $? -eq 0 ]; then
    echo "Successfully updated package information"
  fi
}

upgrade() {
  sudo apt-get upgrade -y > /dev/null 2>&1
  
  if [ $? -eq 0 ]; then
    echo "Successfully upgraded installed packages"
  fi
}

### Syncing with latest updates

update
upgrade

### Including the sources of the setup scripts

run_script "scripts/setup_manuals.sh"
run_script "scripts/setup_archive_tools.sh"
run_script "scripts/setup_web_tools.sh"
run_script "scripts/setup_git_tools.sh"
run_script "scripts/setup_c_tools.sh"
run_script "scripts/setup_gf.sh"
run_script "scripts/setup_nvim.sh"
run_script "scripts/setup_fzf.sh"
run_script "scripts/setup_zoxide.sh"

### Adjust the .bashrc configuration file

config_file="$HOME/.bashrc"

append "alias ls='LC_COLLATE=C ls -la --color=auto --group-directories-first'" "$config_file"
append "export PATH=$PATH:$HOME/software/gf:$HOME/software/nvim/bin:$HOME/.local/bin" "$config_file"
append "export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'" "$config_file"

source "$HOME/.bashrc"
