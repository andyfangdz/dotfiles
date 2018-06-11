function () {
    local script_dir=`dirname ${(%):-%x}`
    source ${script_dir}/functions.zsh

    source ${script_dir}/aliases.zsh
    source ${script_dir}/direnv.zsh
    source ${script_dir}/paths.zsh
    source ${script_dir}/editors.zsh
}
