function() {
  local script_dir=$(dirname ${(%):-%x})

  export ROOT_DIR="$script_dir"

  if [ -e ${script_dir}/local.config.zsh ]; then
    source ${script_dir}/local.config.zsh
  fi

  source ${script_dir}/00-header.zsh
  source ${script_dir}/01-utils.zsh
  source ${script_dir}/10-tools.zsh

  source ${script_dir}/langs/index.zsh

  source ${script_dir}/80-platforms.zsh
  source ${script_dir}/90-misc.zsh
  source ${script_dir}/99-footer.zsh
}
