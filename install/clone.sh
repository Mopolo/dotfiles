#!/bin/sh

echo "Cloning repositories..."

CODE=$HOME/Code
CODE_GH="$CODE/github.com"

mkdir "$CODE"
mkdir "$CODE_GH"

# Personal
cd "$CODE_GH" && clone git@github.com:Mopolo/mopolo.github.io

# AFUP
cd "$CODE_GH" && clone git@github.com:afup/planete
cd "$CODE_GH" && clone git@github.com:Mopolo/afup-web
