#!/usr/bin/env bash
set -ex

ln -s . ~/dotfiles
cd ~/dotfiles

nix-env -i python37

virtualenv env
source env/bin/activate

zsh ~/dotfiles/index.zsh
