#!/bin/bash

set -ex

NODENV_ROOT="$HOME/.nodenv"

# check code from github
git clone https://github.com/nodenv/nodenv.git $NODENV_ROOT
git clone https://github.com/nodenv/node-build.git "$NODENV_ROOT"/plugins/node-build

# compile dynamic bash extension
cd $NODENV_ROOT && src/configure && make -j -C src

