#!/usr/bin/env bash

size=1024 # MB
mount_point=$HOME/tmp
name=$(basename "$mount_point")

usage() {
  echo "usage: $(basename "$0") [mount | umount | remount | check | orphan]" \
    "(default: mount)" >&2
}

process_argv() {
  [ $# -ge 0 -a $# -le 1 ] || { usage; exit 1; }
  case "$1" in
    "")         cmd_mount ;;
    "mount")    cmd_mount ;;
    "umount")   cmd_umount ;;
    "remount")  cmd_remount ;;
    "check")    cmd_check ;;
    "orphan")   cmd_orphan ;;
    *)          usage ;;
  esac
}

cmd_check() {
  is_mounted
}

cmd_mount() {
  if is_mounted; then
    echo "Already mounted at $mount_point" >&2
    return 1
  fi

  sectors=$(( $size * 1024 * 1024 / 512 ))
  dev=$(hdiutil attach -nomount ram://$sectors) \
    && newfs_hfs -v "$name" $dev \
    && mount -t hfs -o nobrowse $dev "$mount_point" \
    && echo "Hello, world!" > "$mount_point"/hello_world \
    && echo "Mounted $name ($size MB) at $mount_point"
}

cmd_umount() {
  dev=$(df "$mount_point" | tail -1 | awk '{ print $1 }')
  [ $dev ] || return 1
  umount "$mount_point" && hdiutil detach "$dev"
}

cmd_remount() {
  if is_mounted; then cmd_umount else true; fi \
    && cmd_mount
}

cmd_orphan() {
  hdiutil info | egrep 'image-path\s+: ram://' -A14 | egrep '^/dev/disk\d+\s*$'
  return 0
}

is_mounted() {
  mount | grep -q " on $mount_point "
}

process_argv "$@"
