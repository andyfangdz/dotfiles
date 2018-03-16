function () {
    local script_dir=`dirname ${(%):-%x}`
    
    source ${script_dir}/gpu.zsh
}

if [ "$COLORTERM" = "gnome-terminal" ] || [ "$COLORTERM" = "xfce4-terminal" ]
then
    export TERM=xterm-256color
elif [ "$COLORTERM" = "rxvt-xpm" ]
then
    export TERM=rxvt-256color
fi

