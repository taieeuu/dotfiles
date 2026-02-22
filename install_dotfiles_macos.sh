#!/bin/sh

set -eux

CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
echo $CONFIG_HOME

#######################
#     stow'd files    #
#######################

stow -vt ~ zsh

for config_file in \
  tmux \
  nvim \
  lazygit \
  lazydocker; do
  mkdir -p ${CONFIG_HOME}/${config_file}
  stow -vt ${CONFIG_HOME}/${config_file} ${config_file}
done

#######################
# end of stow'd files #
#######################

####################
# Install Brewfile #
####################

brew bundle

###################
# End of Brewfile #
###################

###################################
#     Overwrite macos defaults    #
###################################

defaults write com.apple.Finder AppleShowAllFiles -bool true

###################################
# End of Overwrite macos defaults #
###################################
