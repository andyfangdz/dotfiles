alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
tssh_function() {
    ssh $1 -t "tmux -CC attach || tmux -CC"
}
alias tmpdir='cd $(mktemp -d)'
alias tssh=tssh_function
alias sv='source ~/.zshrc'
if _has exa; then
  alias ls='exa'
fi
if _has hub; then
  alias git='hub'
fi
if _has otool; then
  alias ldd='otool -L'
fi
if _has bat; then
  alias cat="bat -p --wrap=never"
fi
if _has diff-so-fancy; then
  alias diff="diff-so-fancy"
fi
if _has prettyping; then
  alias ping='prettyping --nolegend'
fi
if _has ncdu; then
  alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
fi

alias myc="cc \$(<$HOME/dotfiles/flags/common) \$(<$HOME/dotfiles/flags/cflags)"
alias myc++="c++ \$(<$HOME/dotfiles/flags/common) \$(<$HOME/dotfiles/flags/cxxflags)"
alias aria2server='aria2c --enable-rpc --rpc-listen-all'
alias compfix='compaudit | xargs chmod -R 0755'

alias uuid="uuidgen | tr -d - | tr -d '\n' | tr '[:upper:]' '[:lower:]'  | pbcopy && pbpaste && echo"
alias pick1="gshuf -n 1"
alias first1="head -n 1"
