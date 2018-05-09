if [ "$DISABLE_ZPLUG" != true ] ; then
    # These plugins need to be installed last
    zplug check || zplug install

    # Then, source packages and add commands to $PATH
    zplug load
fi
source ${script_dir}/vendor/fzf.zsh
_fzf_compgen_path() {
    rg --files --follow -g "!{.git,node_modules}/*" "$1"
}

ttyctl -f

