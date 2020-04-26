#!/usr/bin/env bash

BREWFILE=$(dirname $0)/Brewfile

brew bundle dump --file=- | rg -v "airbnb/" > BREWFILE 
