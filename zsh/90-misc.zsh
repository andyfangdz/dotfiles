if [ "$DISABLE_ITERM" != true ] ; then
    export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

export GPG_TTY=$(tty)
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

if _has lesspipe.sh ; then 
    export LESSOPEN="|`which lesspipe.sh` %s" LESS_ADVANCED_PREPROCESSOR=1
fi
export SCRATCH_PATH="$HOME/Dropbox/scratchpad.md"
export EMAIL="andyfang.dz@gmail.com"

alias vis="vim $SCRATCH_PATH"
alias fzs="cat $SCRATCH_PATH | fzf --tac --ansi | tee >(tr -d '\n\r' | pbcopy)"
alias adds="cat >> $SCRATCH_PATH"
alias codes="code $SCRATCH_PATH"

OP_DUMMY_ITEM=".dummy"

op_signin() {
  eval $(op signin)
}

op_check_signin() {
  op get item $OP_DUMMY_ITEM >>/dev/null 2>&1 || op_signin
}

op_get_item() {
  op_check_signin
  op get item $1 | jq -r ".details.fields[] | select(.designation==\"$2\").value"
}

op_get_token() {
  op_check_signin
  op get item $1 | jq -r ".details.password"
}

op_get_pass() {
  op_get_item $1 password
}
