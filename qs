#!/bin/sh
{
  verb_install() {
    echo $1
  }

  qs() {
    VERB=$1
    MODULE=$2

    if [ "$VERB" == "i" ]; then
      verb_install $MODULE
    elif [ "$VERB" == "install" ]; then
      verb_install $MODULE
    fi
  }

  qs $1 $2
}