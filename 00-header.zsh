if [[ "$PROFILE_STARTUP" == true ]]; then
    # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
    PS4=$'%D{%M%S%.} %N:%i> '
    exec 3>&2 2>$HOME/tmp/startlog.$$
    setopt xtrace prompt_subst
fi
# Entirety of my startup file... then
if [[ "$PROFILE_STARTUP" == true ]]; then
    unsetopt xtrace
    exec 2>&3 3>&-
fi

script_dir=$(dirname $0)

export ROOT_DIR="$script_dir"

fpath+=${script_dir}/completions

if [ "$DISABLE_ANTIGEN" != true ] ; then
    source ${script_dir}/vendor/antigen.zsh
    antigen init ${script_dir}/.antigenrc
fi
