#!/bin/sh
cd ~/dotfiles
git pull
git submodule sync --recursive
git submodule update --recursive --init
git submodule foreach --recursive git clean -df
git status
