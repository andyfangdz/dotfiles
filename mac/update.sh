#!/usr/bin/env bash
brew leaves | rg -v "airbnb/" > $(dirname $0)/brew-packages.txt 
brew cask list | rg -v "airbnb/" > $(dirname $0)/brew-cask-packages.txt 
