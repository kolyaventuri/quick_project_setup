#!/bin/sh
qs() {
  qs_verb_install() {
    url="git@github.com:quicksetup/$1.git"
    git ls-remote $url > /dev/null 2>&1
    if [ $? -eq 0 ]; then
      echo "Installing quicksetup/$1..."
      git clone $url $QUICK_SETUP_DIR/modules/$1 > /dev/null 2>&1
      echo "Done."
    else
      echo "\033[91m[ERR]\033[39m No \"$1\" Quick Setup module exists"
      exit 1
    fi
  }

  qs_verb_remove() {
    if [ -d "$QUICK_SETUP_DIR/modules/$1" ]; then
      echo "Uninstalling \"$1\" module..."
      rm -r "$QUICK_SETUP_DIR/modules/$1"
      echo "Done."
    else
      echo "\033[91m[ERR]\033[39m No \"$1\" module installed."
      exit 1
    fi
  }

  qs_verb_update() {
    if [ -d "$QUICK_SETUP_DIR/modules/$1" ]; then
      echo "Updating \"$1\" module..."
      cur_dir=$(pwd)
      cd "$QUICK_SETUP_DIR/modules/$1"
      git pull > /dev/null 2>&1
      cd $cur_dir
      echo "Done."
    else
      echo "\033[91m[ERR]\033[39m No \"$1\" module installed."
      exit 1
    fi
  }

  VERB=$1
  MODULE=$2

  if [ "$VERB" == "i" -o "$VERB" == "install" ]; then
    qs_verb_install $MODULE
  elif [ "$VERB" == "r" -o "$VERB" == "remove" ]; then
    qs_verb_remove $MODULE
  elif [ "$VERB" == "u" -o "$VERB" == "update" ]; then
    qs_verb_update $MODULE
  fi
}
