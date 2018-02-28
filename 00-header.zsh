
script_dir=$(dirname $0)

export ROOT_DIR="$script_dir"

fpath+=${script_dir}/completions

if [ "$DISABLE_ANTIGEN" != true ] ; then
    source ${script_dir}/vendor/antigen.zsh
    antigen init ${script_dir}/.antigenrc
fi
