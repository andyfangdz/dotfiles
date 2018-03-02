function load_direnv() {
  _direnv_hook() {
    eval "$(direnv export zsh)";
  }

  typeset -ag precmd_functions;
  if [[ -z ${precmd_functions[(r)_direnv_hook]} ]]; then
    precmd_functions+=_direnv_hook;
  fi
}

if [ "$LAZY_DIRENV" != true ] ; then
    load_direnv
fi
