script_dir=$(dirname $0)

export PATH=~/.local/bin:${script_dir}/bin/:$PATH

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"


source ${script_dir}/vendor/antigen.1.4.1.zsh

export SPACESHIP_PROMPT_ADD_NEWLINE=false
antigen init ${script_dir}/.antigenrc

source ${script_dir}/aliases.zsh
source ${script_dir}/python.zsh
source ${script_dir}/gpu.zsh
source ~/.sdkman/bin/sdkman-init.sh
