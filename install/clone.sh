#!/bin/sh

echo "Cloning repositories..."

CODE=$HOME/Code
SITES=$HOME/Sites

mkdir "$CODE"
mkdir "$SITES"

# Personal
git clone git@github.com:Mopolo/mopolo.github.io.git "$SITES"/portfolio

cd "$SITES" && valet park
