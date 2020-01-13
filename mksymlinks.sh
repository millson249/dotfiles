#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Default Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old/$(date +%F_%H%M%S)  # old dotfiles backup directory
files="gitconfig vimrc vim janus zshrc oh-my-zsh omz vimrc.before vimrc.after profile inputrc tmux.conf scripts"    # list of files/folders to symlink in homedir
xfiles="Xresources xinitrc xprofile config/i3 config/picom"

##########

########## Parse arguements

while [[ $# > 0 ]]
do
  key="$1"

  case $key in
    -X)
      LINKXFILES=true
      shift
      ;;
  esac
  shift
done
##########

# create dotfiles_old in homedir
echo -n "Creating $olddir to backup existing dotfiles in ~..."
mkdir -p $olddir
echo "Done"
echo ""

# change to the dotfiles directory
echo -n "Changing to the $dir directory..."
cd $dir
echo "Done"
echo ""

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving existing dotfiles from ~ to $olddir and creating symlinks..."
for file in $files; do
  if [ -e ~/.$file ]; then
    echo "Moving .$file ..."
    mv -v ~/.$file $olddir
  fi
  echo "Creating symlink to $file ..."
  ln -sfv $dir/$file ~/.$file
done

if [ "$LINKXFILES"  = true ]; then
  echo ""
  echo "Processing X files..."
  for file in $xfiles; do
    if [ -e ~/.$file ]; then
      echo "Moving .$file ..."
      mv -v ~/.$file $olddir
    fi
    echo "Creating symlink to $file ..."
    ln -sfv $dir/$file ~/.$file
  done
fi
echo ""

# Test to see if zsh is installed.  If it is, set as default shell if not already set.
echo "Attempting to set zsh as the default shell..."
shellpath=$(command -v zsh)
if [ $SHELL = $shellpath ]; then
  echo "Shell already set to zsh!"
else
  if [ $shellpath ]; then
    chsh -s $shellpath
    echo "Done!"
  else
    echo "Error: zsh is not installed!"
  fi
fi

