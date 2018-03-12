#!/bin/sh
{

  qs() {
    qs_verb_install() {
      url="git@github.com:quicksetup/$1.git"
      git ls-remote "github.com/quicksetup/$1" > /dev/null 2>&1
      if [ $? -eq 0 ]; then
        echo "Installing quicksetup/$1..."
        git clone $url $QUICK_SETUP_DIR/$1 > /dev/null 2>&1
        echo "Done!"
      else
        echo "\033[91m[ERR]\033[39m No \"$1\" Quick Setup module exists"
        exit 1
      fi
    }

    VERB=$1
    MODULE=$2

    if [ "$VERB" == "i" ]; then
      qs_verb_install $MODULE
    elif [ "$VERB" == "install" ]; then
      qs_verb_install $MODULE
    fi
  }

  qs $1 $2
}