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

export FZF_DEFAULT_COMMAND='fd --type f'

export FZF_DEFAULT_OPTS="--height 60% --reverse --border"

alias fzp="fzf --preview '$my_fzf_preview' --preview-window down"
