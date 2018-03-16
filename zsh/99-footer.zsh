if [ "$DISABLE_ZPLUG" != true ] ; then
    # These plugins need to be installed last
    zplug check || zplug install

    # Then, source packages and add commands to $PATH
    zplug load
fi
