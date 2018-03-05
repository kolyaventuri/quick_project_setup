#!/bin/sh
DIR=$1
LOAD_LANG=$2
CURR_PATH=$3

cp "$DIR/modules/$LOAD_LANG/.gitignore.template" "$CURR_PATH/.gitignore"
git init