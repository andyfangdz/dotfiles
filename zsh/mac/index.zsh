bootcamp() {
    sudo /usr/sbin/bless -mount /Volumes/BOOTCAMP -setBoot  --nextonly
    sudo /sbin/shutdown -r now
}

export BYOBU_PREFIX=/usr/local

function anybar { echo -n $1 | nc -4u -w0 localhost ${2:-1738}; }

unformat() {
    pbpaste | pbcopy
}

alias ldd='otool -L'
alias brewski='brew update && brew upgrade && brew cleanup && brew cask upgrade && brew cask cleanup; brew doctor'
alias synctime="docker run -it --rm --privileged --pid=host debian nsenter -t 1 -m -u -n -i date -u $(date -u +%m%d%H%M%Y)"

pman () {
    man -t $@ | ps2pdf - - | open -f -a /Applications/Preview.app
}

tman () {
  MANWIDTH=160 MANPAGER='col -bx' man $@ | mate
}

quit () {
    for app in $*; do
        osascript -e 'quit app "'$app'"'
    done
}
