#!/usr/bin/env bash

mkdir -p $HOME/Sites/webroot

ln -sf $PWD/Caddyfile $HOME/Sites/Caddyfile
sudo ln -sf $PWD/com.caddyserver.web.plist /Library/LaunchAgents/com.caddyserver.web.plist
