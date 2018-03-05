#!/bin/sh

LANG=$1
CURR_PATH=${2-$(pwd)}
SOURCE="${BASH_SOURCE[0]}"
DIR="$( dirname "$SOURCE" )"

$DIR/helpers/git.sh