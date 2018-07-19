function load_rbenv() {
    path+=$HOME/.rbenv/bin
    eval "$(rbenv init -)"
}

if [ "$LAZY_RBENV" != true ] ; then
    load_rbenv
fi
