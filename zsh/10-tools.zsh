source ${script_dir}/vendor/fzf.zsh

multi_colorize='
    [[ $(file --mime {}) =~ binary ]] &&
        echo {} is a binary file ||
        (highlight -O ansi -l {} ||
        coderay {} ||
        rougify {} ||
        pygmentize -f terminal256 -O style=monokai -g {} ||
        cat {}) 2> /dev/null | head -500
'

my_fzf_preview="file {} && echo && $multi_colorize"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bindkey -s '^p' 'vim $(fzf)^M'
export FZF_DEFAULT_OPTS="--height 60% --reverse --border"

alias fzp="fzf --preview '$my_fzf_preview' --preview-window down"
