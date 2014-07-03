#!/bin/sh
# Update dotfiles and submodules
cd ~/dotfiles
git pull
git submodule sync --recursive
git submodule update --recursive --init
git submodule foreach --recursive git clean -df
# Janus update
cd ~/dotfiles/vim
rake
