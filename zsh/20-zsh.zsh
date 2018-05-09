HISTFILE=$HOME/Dropbox/shell/zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt APPEND_HISTORY
setopt HIST_VERIFY
setopt EXTENDED_HISTORY

setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY 
setopt HIST_VERIFY

setopt BRACE_CCL
setopt LONG_LIST_JOBS
setopt AUTO_LIST
setopt MENU_COMPLETE
setopt COMPLETE_ALIASES

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select

