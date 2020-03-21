#!/bin/sh
# Update dotfiles and submodules
cd ~/dotfiles
git pull
git submodule foreach git clean -df
git submodule update --init --remote
# Janus update
cd ~/dotfiles/vim
rake
