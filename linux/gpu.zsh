typeset -UTx LD_LIBRARY_PATH ld_library_path

path=(/usr/local/nvidia/bin /usr/local/cuda/bin $path)

ld_library_path=(/usr/local/nvidia/lib /usr/local/nvidia/lib64 $ld_library_path)
