function load_pyenv() {
    path+=$HOME/.pyenv/bin
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    alias ipy='jupyter qtconsole --ConsoleWidget.font_family="Consolas" --ConsoleWidget.font_size=13'
    export PYENV_ROOT=$HOME/.pyenv
}

if [ "$LAZY_PYENV" != true ] ; then
    load_pyenv
fi
