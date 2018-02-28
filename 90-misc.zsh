if [ "$DISABLE_ITERM" != true ] ; then
    export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "
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
