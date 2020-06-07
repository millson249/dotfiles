#!/bin/sh
# Update dotfiles and submodules
cd ~/dotfiles
git pull
git submodule update --init --remote
