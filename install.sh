#!/bin/bash

SCRIPT_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Installing required applications

## Installing OMZ && autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 

## Installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Installing apps
brew install go node pnpm exa zoxide neovim starship gh htop cloc fastjar tmux neofetch
brew install --cask brave-browser spotify iterm2

## Installing wm
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

## Downloading and installing nerdfont
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip"
FILEPATH="$HOME/Downloads/jbm.zip"
./get_font.sh $FONT_URL $FILEPATH
mkdir ~/Library/Fonts/JetBrainsMono
cd ~/Library/Fonts/JetBrainsMono
fastjar xvf $FILEPATH
cd $SCRIPT_PATH

## Installing rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup component add rust-analyzer

## Installing docker
curl https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64 -o ~/Downloads/Docker.dmg
sudo hdiutil attach ~/Downloads/Docker.dmg
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
sudo hdiutil detach /Volumes/Docker

# Setting up configs

## Setting up zsh
cp ./.zshrc ~/
cp ./starship.toml ~/.config/

source ~/.zshrc

## Setting up neovim
cp -R ./nvim ~/.config/

## Setting up wm
cp -R ./yabai ~/.config/
cp -R ./skhd ~/.config/

yabai --start-service
skhd --start-service

## Copy iterm colorscheme
mkdir -p ~/.config/iterm2/colors
cp ./iterm/rose-pine.itermcolors ~/.config/iterm2/colors/
