function () {
    local script_dir=`dirname ${(%):-%x}`

    if [ "$DISABLE_GOLANG" != true ] ; then
        source ${script_dir}/golang.zsh
    fi

    if [ "$DISABLE_SDKMAN" != true ] ; then
        source ${script_dir}/java.zsh
    fi

    if [ "$DISABLE_NODEJS" != true ] ; then
        source ${script_dir}/nodenv.zsh
    fi

    if [ "$DISABLE_PYTHON" != true ] ; then
        source ${script_dir}/python.zsh
    fi

    if [ "$DISABLE_RUST" != true ] ; then
        source ${script_dir}/rust.zsh
    fi
}
