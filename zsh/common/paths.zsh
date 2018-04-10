path+=/usr/local/bin
path+=$HOME/.local/bin
path+=$HOME/local/bin
path+=$HOME/local/opt/bin
path+=$HOME/bin
path+=/usr/local/sbin

function() {
    local bin_dir=`dirname ${(%):-%x}`/../bin
    path+=$bin_dir
}
