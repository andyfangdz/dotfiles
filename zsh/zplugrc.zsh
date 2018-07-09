if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update
else
    source ~/.zplug/init.zsh
fi

zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:"fzf", \
    frozen:1

zplug "b4b4r07/zsh-gomi", \
    as:command, \
    use:bin/gomi, \
    on:junegunn/fzf-bin

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/node", from:oh-my-zsh
zplug "liangguohuan/fzf-marker"

zplug "lib/clipboard",   from:oh-my-zsh
zplug "lib/compfix",   from:oh-my-zsh
zplug "lib/correction",   from:oh-my-zsh
zplug "lib/directories",   from:oh-my-zsh
zplug "lib/grep",   from:oh-my-zsh
zplug "lib/history",   from:oh-my-zsh
zplug "lib/spectrum",   from:oh-my-zsh
zplug "lib/termsupport",   from:oh-my-zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"

zplug "b4b4r07/enhancd", use:init.sh

if zplug check "b4b4r07/enhancd"; then
    if _is $HOSTTYPE_MAC; then
        FORCE_COLOR_LS="CLICOLOR_FORCE=1 ls -G -C {}"
    fi
    if _is $HOSTTYPE_LINUX; then
        FORCE_COLOR_LS="ls --color=always -C {}"
    fi
    export ENHANCD_FILTER="fzf --height 60% --reverse --ansi --preview '$FORCE_COLOR_LS' --preview-window down"
    #export ENHANCD_FILTER="fzy:fzf --height 50% --reverse --ansi"
    export ENHANCD_DISABLE_DOT=1
fi

zplug "skx/sysadmin-util"

zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "zsh-users/zsh-apple-touchbar", if:"[[ $OSTYPE == *darwin* ]]"
zplug "unixorn/tumult.plugin.zsh", if:"[[ $OSTYPE == *darwin* ]]"

zplug "unixorn/warhol.plugin.zsh"

zplug 'bric3/nice-exit-code'
zplug 'djui/alias-tips'
# zplug 'hchbaw/auto-fu.zsh', defer:2
zplug 'marzocchi/zsh-notify'

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

zplug 'zplug/zplug'
