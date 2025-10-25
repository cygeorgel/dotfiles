#!/bin/bash

dotfiles="${HOME}/dotfiles"

rm -rf ${HOME}/.config/kitty
ln -s ${dotfiles}/kitty ${HOME}/.config/kitty

rm -rf ${HOME}/.config/nvim
ln -s ${dotfiles}/nvim $HOME/.config/nvim

rm -rf ${HOME}/.tmux.conf
ln -s ${dotfiles}/tmux/tmux.conf ${HOME}/.tmux.conf

# mkdir -p $HOME/.local/bin
# rm -rf $HOME/.local/bin/t.sh
# ln -s $dotfiles/scripts/t.sh $HOME/.local/bin/t.sh

# https://github.com/phpactor/phpactor
#ln -s $HOME/dotfiles/phpactor/bin/phpactor /usr/local/bin/phpactor
