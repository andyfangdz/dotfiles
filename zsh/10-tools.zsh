export FZF_DEFAULT_COMMAND='rg --files --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bindkey -s '^p' 'vim $(fzf)^M'
export FZF_DEFAULT_OPTS="--reverse --border"

if _has npx; then
    source <(npx --shell-auto-fallback zsh)
fi
