if [ "$DISABLE_ZPLUG" != true ] ; then
    # These plugins need to be installed last
    zplug check || zplug install

    # Then, source packages and add commands to $PATH
    zplug load
fi
source ${script_dir}/vendor/fzf.zsh
_fzf_compgen_path() {
    rg --files --follow -g '!{.git,node_modules}/*' "$1"
}

ttyctl -f

if _is $HOSTTYPE_MAC; then
  export _FASD_BACKENDS=(spotlight current viminfo)
fi
if _is $HOSTTYPE_LINUX; then
  export _FASD_BACKENDS=(recently-used current viminfo)
fi
fasd_cache="$HOME/.cache/.fasd-init-zsh"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init auto >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

if [[ $1 == eval ]]
then
    eval "$@"
set --
fi
