function load_goenv() {
    export GOENV_ROOT="$HOME/.goenv"
    path+=$GOENV_ROOT/bin
    eval "$(goenv init -)"
    
}

export GOPATH=$HOME/go

if [ "$LAZY_GOENV" != true ] ; then
    load_goenv
fi
