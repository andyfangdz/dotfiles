_has() {
  return $( whence $1 >/dev/null )
}

# Returns whether the given statement executed cleanly. Try to avoid this
# because this slows down shell loading.
_try() {
  return $( eval $* >/dev/null 2>&1 )
}

# Returns whether the current host type is what we think it is. (HOSTTYPE is
# set later.)
_is() {
  return $( [ "$HOSTTYPE" = "$1" ] )
}

# Returns whether out terminal supports color.
_color() {
  return $( [ -z "$INSIDE_EMACS" -a -z "$VIMRUNTIME" ] )
}

# ENVIRONMENT VARIABLES {{{1

# Yes, this defeats the point of the TERM variable, but everything pretty much
# uses modern ANSI escape sequences. I've found that forcing everything to be
# "rxvt" just about works everywhere. (If you want to know if you're in screen,
# use SHLVL or TERMCAP.)
if _color; then
  if [ -n "$ITERM_SESSION_ID" ]; then
    if [ "$TERM" = "screen" ]; then
      export TERM=screen-256color
    else
      export TERM=xterm-256color
    fi
  elif [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
      export TERM=xterm-256color
  else
    export TERM=rxvt
  fi
else
  export TERM=xterm
fi

# Utility variables.
if which hostname >/dev/null 2>&1; then
  HOSTNAME=`hostname`
elif which uname >/dev/null 2>&1; then
  HOSTNAME=`uname -n`
else
  HOSTNAME=unknown
fi
export HOSTNAME

export HOSTTYPE_LINUX="Linux"
export HOSTTYPE_MAC="Darwin"

# HOSTTYPE = { Linux | OpenBSD | SunOS | etc. }
if which uname >/dev/null 2>&1; then
  HOSTTYPE=`uname -s`
else
  HOSTTYPE="unknown"
fi
export HOSTTYPE

# PAGER
if [ -n "$INSIDE_EMACS" ]; then
  export PAGER=cat
else
  if _has less; then
    export PAGER=less
    if _color; then
      export LESS='-R'
    fi
  fi
fi

# EDITOR
if _has vim; then
  export EDITOR=vim VISUAL=vim
elif _has vi; then
  export EDITOR=vi VISUAL=vi
elif _has emacs; then
  export EDITOR=emacs VISUAL=emacs
fi

# Overridable locale support.
if [ -z $$LC_ALL ]; then
  export LC_ALL=C
fi
if [ -z $LANG ]; then
  export LANG=en_US
fi

# History control.
SAVEHIST=100000
HISTSIZE=100000
if [ -e ~/priv/ ]; then
  HISTFILE=~/priv/zsh_history
elif [ -e ~/secure/ ]; then
  HISTFILE=~/secure/zsh_history
else
  HISTFILE=~/.zsh_history
fi
if [ -n "$HISTFILE" -a ! -w $HISTFILE ]; then
  echo
  echo "[31;1m HISTFILE [$HISTFILE] not writable! [0m"
  echo
fi

# APPLICATION CUSTOMIZATIONS {{{1

# GNU grep
if _color; then
  export GREP_COLOR='1;32'
fi

# Ack is better than grep
if ! _color; then
  alias ack='ack --nocolor'
fi

# GNU and BSD ls colorization.
if _color; then
  export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=33:so=01;35:bd=33;01:cd=33;01:or=01;05;37;41:mi=01;37;41:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:'
  export LSCOLORS='ExGxFxdxCxDxDxcxcxxCxc'
  export CLICOLOR=1
fi

# PATH MODIFICATIONS {{{1

# Functions which modify the path given a directory, but only if the directory
# exists and is not already in the path. (Super useful in ~/.zshlocal)


__force_prepend_posix() {
  eval "export $1=$2:\$$1"
}

__prepend_posix() {
  if [ -d $2 ]; then
    __force_prepend_posix $1 $2
  fi
}

_prepend_to_path() {
  if [ -d $1 -a -z ${path[(r)$1]} ]; then
    path=($1 $path);
  fi
}

_append_to_path() {
  if [ -d $1 -a -z ${path[(r)$1]} ]; then
    path+=$1;
  fi
}

_force_prepend_to_path() {
  path=($1 ${(@)path:#$1})
}

# Note that there is NO dot directory appended!

_force_prepend_to_path /usr/local/sbin
_force_prepend_to_path /usr/local/bin
_force_prepend_to_path ~/bin
_force_prepend_to_path /usr/local/heroku/bin

path+=/usr/games
path+=/usr/sbin

# Add our docs, too


export INFOPATH=$HOME/dotfiles/info:$INFOPATH

