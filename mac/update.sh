#!/usr/bin/env bash
brew leaves > $(dirname $0)/brew-packages.txt 
brew cask list > $(dirname $0)/brew-cask-packages.txt 
