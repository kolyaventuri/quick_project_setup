#!/bin/sh
DIR=$1
LOAD_LANG=$2
CURR_PATH=$3

TEMPLATE="$DIR/modules/$LOAD_LANG/.gitignore.template"

if [ -f $TEMPLATE ]; then
  cp $TEMPLATE "$CURR_PATH/.gitignore"
fi

git init