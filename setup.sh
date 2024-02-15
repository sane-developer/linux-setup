#!/bin/bash

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

config_file="$HOME/.bashrc"

third_party_software_dir="$HOME/software"

### Setting up third party software directory

mkdir $third_party_software_dir

### Syncing with latest updates

update

upgrade

### Network requests (Tools)

install "curl"

install "wget"

### Archives (Tools)

install "tar"

install "gzip"

install "unzip"

### Manuals (Tools)

install "man"

install "man-db"

install "manpages-dev"

### Development toolchain (Tools) 

install "git"

install "ssh"

install "ssh-keygen"

### C/C++ Toolchain (Tools)

install "gcc"

install "g++"

install "gdb"

install "make"

install "cmake"

### GF [GDB Frontend] (Tools)

install "libx11-dev"

install "python3"

install "python3-venv"

clone "https://github.com/nakst/gf.git" "$third_party_software_dir/gf"

source "$third_party_software_dir/gf/build.sh"

echo "GF has been successfully installed"

### Neovim [Superior text editor] (Tools)

cd "$third_party_software_dir"

curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz

tar xzvf nvim-linux64.tar.gz

mv nvim-linux64 nvim

rm nvim-linux64.tar.gz

ln -s /usr/local/nvim/bin/nvim /usr/local/bin/nvim

echo "Neovim has been successfully installed"

### Fuzzy finder [File search extension] (Terminal)

clone "https://github.com/junegunn/fzf.git" "$third_party_software_dir/fzf"

source "$third_party_software_dir/fzf/install"

echo "Fuzzy finder has been successfully installed"

### Zoxide [Better terminal navigation] (Terminal)

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | source

eval "$(zoxide init --cmd cd bash)" >> "$config_file"

echo "Zoxide has been successfully installed"

### Sync config file with the changes

source "$config_file"
