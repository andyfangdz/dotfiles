#!/usr/bin/env bash
set -ex

ln -s . ~/dotfiles
cd ~/dotfiles
dotdrop install

zsh ~/dotfiles/index.zsh
