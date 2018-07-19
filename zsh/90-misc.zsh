if [ "$DISABLE_ITERM" != true ] ; then
    export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

function upload_gem {
    username=`whoami`
    # resolve the DNS entry only once,
    # otherwise the commands might go to different hosts
    host=$(dig +short geminabox-internal.aws.airbnb.com|head -n1|sed s'/\.$//')
  
    # Upload to gem server and add it
    scp $1 ${username}@${host}:~ && \
        ssh ${username}@${host} "add_gem.rb $1; rm $1"
}

export GPG_TTY=$(tty)
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

export SCRATCH_PATH="$HOME/Dropbox/scratchpad.md"

alias vis="vim $SCRATCH_PATH" 
alias fzs="cat $SCRATCH_PATH | fzf --tac --ansi | tee >(tr -d '\n\r' | pbcopy)"
alias adds="cat >> $SCRATCH_PATH"
alias codes="code $SCRATCH_PATH"
