path+=$HOME/.nodenv/bin
eval "$(nodenv init -)"

if [ "$DISABLE_YARN" != true ] ; then
    path+=`yarn global bin`
fi
