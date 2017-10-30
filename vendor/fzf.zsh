# Setup fzf
# ---------

if [[ ! -d ~/.fzf ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf 
  ~/.fzf/install --key-bindings --completion --no-update-rc
fi
if [[ ! "$PATH" == *${HOME}/.fzf/bin* ]]; then
  export PATH="$PATH:${HOME}/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${HOME}/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${HOME}/.fzf/shell/key-bindings.zsh"
