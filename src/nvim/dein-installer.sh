#!/usr/bin/env bash
set -euxo pipefail

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s - ~/.cache/dein
