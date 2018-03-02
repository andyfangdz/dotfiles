function load_nodenv() {
    path+=$HOME/.nodenv/bin
    eval "$(nodenv init -)"

    if [ "$DISABLE_YARN" != true ] ; then
        path+=`yarn global bin`
    fi
}

if [ "$LAZY_NODENV" != true ] ; then
    load_nodenv
fi
