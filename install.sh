#!/usr/bin/env bash

{ # ensure entire script downloaded
  INSTALL_DIR = "$HOME/.quick_setup"
  WORKING_DIR = "$(pwd)"
  if [ ! -d "$INSTALL_DIR" ]; then
    mkdir $INSTALL_DIR

    cd $INSTALL_DIR

    

    cd $WORKING_DIR
  else
    echo "ERR: Quick setup already installed."
    echo "Run rm -r $INSTALL_DIR"
  fi
} # ensure entire script downloaded