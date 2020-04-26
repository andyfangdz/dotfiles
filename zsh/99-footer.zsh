source ${script_dir}/vendor/fzf.zsh
_fzf_compgen_path() {
    rg --files --follow -g '!{.git,node_modules}/*' "$1"
}

ttyctl -f
