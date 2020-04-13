path=("/usr/local/bin" $path)
path=("$HOME/.local/bin" $path)
path=("$HOME/local/bin" $path)
path=("$HOME/local/opt/bin" $path)
path=("$HOME/bin" $path)
path=("$HOME/go/bin" $path)
path=("/usr/local/sbin" $path)
if [ -f "/usr/libexec/java_home" ]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
    path=("$JAVA_HOME/bin:$PATH" $path)
fi
if _is "$HOSTTYPE_MAC"; then
    path=($DOTFILES_DIR/mac/bin $path)
fi

function() {
    local bin_dir=`dirname ${(%):-%x}`/../../bin
    local vendor_bin_dir=`dirname ${(%):-%x}`/../../vendor/bin
    path=("$bin_dir" $path)
    path=("$vendor_bin_dir" $path)
}
