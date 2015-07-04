#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="gitconfig vimrc vim zshrc oh-my-zsh vimrc.before vimrc.after profile"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir to backup existing dotfiles in ~ ..."
mkdir -p $olddir
echo "Done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "Done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving existing dotfiles from ~ to $olddir"
for file in $files; do
    if [ -e ~/.$file ]; then
      mv -v ~/.$file ~/dotfiles_old/
    fi
    echo "Creating symlink to $file in home directory."
    ln -sv $dir/$file ~/.$file
done

# Test to see if zsh is installed.  If it is, set as default shell if not already set.
echo "Setting zsh as default shell..."
shellpath=$(command -v zsh)
if [ $shellpath ]; then
  chsh -s $shellpath
  echo "Done!"
else
  echo "Error: zsh is not installed!"
fi
