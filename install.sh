#!/usr/bin/env bash

{ # ensure entire script downloaded
  INSTALL_DIR="$HOME/.quick_setup"
  echo Installing to $INSTALL_DIR
  WORKING_DIR="$(pwd)"
  if [ ! -d "$INSTALL_DIR" ]; then
    mkdir $INSTALL_DIR

    cd $INSTALL_DIR

    git clone git@github.com/kolyaventuri/quick_project_setup.git

    cd $WORKING_DIR

    echo "Done installing!"
  else
    echo "ERR: Quick setup already installed."
    echo "Run rm -r $INSTALL_DIR"
  fi
} # ensure entire script downloaded