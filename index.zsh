local script_dir=$(dirname ${(%):-%x})

local script_dir_end=$script_dir
export DOTFILES_DIR=$script_dir
export ROOT_DIR="$script_dir/zsh"
export local_zsh_dir="$ROOT_DIR"

if [ -e ${script_dir}/local.config.zsh ]; then
  source ${script_dir}/local.config.zsh
fi

source ${local_zsh_dir}/00-utils.zsh
source ${local_zsh_dir}/01-header.zsh
source ${local_zsh_dir}/10-tools.zsh
source ${local_zsh_dir}/20-zsh.zsh
source ${local_zsh_dir}/30-keys.zsh
source ${local_zsh_dir}/70-gpg.zsh
source ${local_zsh_dir}/80-platforms.zsh
source ${local_zsh_dir}/90-misc.zsh
source ${local_zsh_dir}/99-footer.zsh

source ${local_zsh_dir}/common/index.zsh
source ${local_zsh_dir}/langs/index.zsh

if [ -e ${script_dir_end}/local-end.config.zsh ]; then
  source ${script_dir_end}/local-end.config.zsh
fi
