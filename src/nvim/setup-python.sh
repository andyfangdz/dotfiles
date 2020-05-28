#/usr/bin/env bash

export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

PYTHON2=python2
PYTHON3=python3

pyenv install $py2_version
pyenv install $py3_version

pyenv virtualenv $py2_version neovim2
pyenv virtualenv $py3_version neovim3

pyenv shell neovim2
pip install neovim
pyenv which python  # Note the path

pyenv shell neovim3
pip install neovim
pyenv which python  # Note the path

# The following is optional, and the neovim3 env is still active
# This allows flake8 to be available to linter plugins regardless
# of what env is currently active.  Repeat this pattern for other
# packages that provide cli programs that are used in Neovim.
pip install flake8
ln -s `pyenv which flake8` ~/bin/flake8  # Assumes that $HOME/bin is in $PATH
