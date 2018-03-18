alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
tssh_function() {
    ssh $1 -t "tmux -CC attach || tmux -CC"
}
alias tssh=tssh_function
alias sv='source ~/.zshrc'
if _has nvim; then
  alias vim='nvim'
fi
if _has exa; then
  alias ls='exa'
fi
if _has hub; then
  alias git='hub'
fi
if _has otool; then
  alias ldd='otool -L'
fi

alias myc="cc \$(<$HOME/dotfiles/flags/common) \$(<$HOME/dotfiles/flags/cflags)"
alias myc++="c++ \$(<$HOME/dotfiles/flags/common) \$(<$HOME/dotfiles/flags/cxxflags)"

alias emc='emacsclient -a "" -c'
alias em='emacsclient -a "" -t'

alias aria2server='aria2c --enable-rpc --rpc-listen-all'

