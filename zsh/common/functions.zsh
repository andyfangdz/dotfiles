# http://apple.stackexchange.com/questions/12161/os-x-terminal-must-have-utilities
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# git new branch
function gnb {
  git checkout -b andy--$1
}

# git PR
function gpr {
  hub pr list $@ -h $(git branch-name)
}

function gpb {
  gpr -f $'# %t\n%b' | pandoc -f gfm | lynx -stdin -dump
}

# git PR open
function gpo {
  gpr -f %U | xargs open
}

export GNPR_TEMPLATE="$DOTFILES_DIR/PULL_REQUEST_TEMPLATE.md"

# create a new PR
function gnpr {
  hub pull-request -F - --edit < $GNPR_TEMPLATE
}

function gnpro {
  hub pull-request -F - -o --edit < $GNPR_TEMPLATE
}
