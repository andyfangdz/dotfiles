path+=/usr/local/bin
path+=$HOME/.local/bin
path+=$HOME/local/bin
path+=$HOME/local/opt/bin
path+=$HOME/bin
path+=/usr/local/sbin

if _is "$HOSTNAME_MAC"; then
    path+="/Applications/VMware Fusion.app/Contents/Library"
fi

function() {
    local bin_dir=`dirname ${(%):-%x}`/../../bin
    local vendor_bin_dir=`dirname ${(%):-%x}`/../../vendor/bin
    path+=$bin_dir
    path+=$vendor_bin_dir
}
