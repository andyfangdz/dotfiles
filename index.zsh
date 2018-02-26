script_dir=$(dirname $0)

export PATH=~/.local/bin:${script_dir}/bin/:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
source ${script_dir}/vendor/antigen.1.4.1.zsh

export SPACESHIP_PROMPT_ADD_NEWLINE=false
antigen init ${script_dir}/.antigenrc

source ${script_dir}/aliases.zsh
source ${script_dir}/nodenv.zsh
source ${script_dir}/python.zsh
source ${script_dir}/gpu.zsh
export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "
source ${script_dir}/vendor/fzf.zsh
export PATH="$PATH:`yarn global bin`"

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
