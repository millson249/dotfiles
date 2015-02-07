#!/bin/sh
# Update dotfiles and submodules
cd ~/dotfiles
git pull
git submodule foreach git clean -df
git submodule update --init --remote
git submodule foreach git checkout master
git submodule foreach git pull
# Janus update
cd ~/dotfiles/vim
rake
