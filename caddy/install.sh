#!/usr/bin/env bash

mkdir -p $HOME/Sites/webroot

ln -sf Caddyfile $HOME/Sites/Caddyfile
ln -sf com.caddyserver.web.plist $HOME/Library/LaunchAgents/com.caddyserver.web.plist
