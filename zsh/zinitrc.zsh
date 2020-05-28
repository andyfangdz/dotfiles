### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{11220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit load zsh-users/zsh-autosuggestions

zinit light zdharma/fast-syntax-highlighting

zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

zinit snippet OMZL::functions.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::compfix.zsh
zinit snippet OMZL::correction.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::grep.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::spectrum.zsh
zinit snippet OMZL::termsupport.zsh

zinit snippet OMZP::git
zinit snippet OMZP::git-extras
zinit snippet OMZP::colorize
zinit snippet OMZP::node

zinit ice if"[[ $OSTYPE == *darwin* ]]" svn wait"0" lucid atinit"local ZSH=\$PWD" \
    atclone"mkdir -p plugins; cd plugins; ln -sfn ../. osx"
zinit snippet OMZ::plugins/osx

zinit load "liangguohuan/fzf-marker"
zinit load "zsh-users/zsh-completions"

zinit load "b4b4r07/enhancd"

if _is $HOSTTYPE_MAC; then
    FORCE_COLOR_LS="CLICOLOR_FORCE=1 ls -G -C {}"
fi
if _is $HOSTTYPE_LINUX; then
    FORCE_COLOR_LS="ls --color=always -C {}"
fi
export ENHANCD_FILTER="fzf-tmux-__enhancd"
#export ENHANCD_FILTER="fzf-tmux --height 60% --reverse --ansi --preview '$FORCE_COLOR_LS' --preview-window down"
#export ENHANCD_FILTER="fzy:fzf --height 50% --reverse --ansi"
export ENHANCD_DISABLE_DOT=1


zinit load "skx/sysadmin-util"
zinit ice if"[[ $OSTYPE == *darwin* ]]"
zinit load "zsh-users/zsh-apple-touchbar"
zinit ice if"[[ $OSTYPE == *darwin* ]]"
zinit load "unixorn/tumult.plugin.zsh"
zinit ice if"[[ $OSTYPE == *darwin* ]]"
zinit load 'marzocchi/zsh-notify'

zinit load "unixorn/warhol.plugin.zsh"

zinit load 'bric3/nice-exit-code'
zinit load 'djui/alias-tips'
# zinit load 'hchbaw/auto-fu.zsh', defer:2

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure
