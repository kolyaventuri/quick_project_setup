#!/usr/bin/env bash

{ # ensure entire script downloaded

  detect_profile() {
    if [ -n "${PROFILE}" ] && [ -f "${PROFILE}" ]; then
      echo "${PROFILE}"
      return
    fi

    local DETECTED_PROFILE
    DETECTED_PROFILE=''
    local SHELLTYPE
    SHELLTYPE="$(basename "/$SHELL")"

    if [ "$SHELLTYPE" = "bash" ]; then
      if [ -f "$HOME/.bashrc" ]; then
        DETECTED_PROFILE="$HOME/.bashrc"
      elif [ -f "$HOME/.bash_profile" ]; then
        DETECTED_PROFILE="$HOME/.bash_profile"
      fi
    elif [ "$SHELLTYPE" = "zsh" ]; then
      DETECTED_PROFILE="$HOME/.zshrc"
    fi

    if [ -z "$DETECTED_PROFILE" ]; then
      for EACH_PROFILE in ".profile" ".bashrc" ".bash_profile" ".zshrc"
      do
        if DETECTED_PROFILE="$(try_profile "${HOME}/${EACH_PROFILE}")"; then
          break
        fi
      done
    fi

    if [ ! -z "$DETECTED_PROFILE" ]; then
      echo "$DETECTED_PROFILE"
    fi
  }

  try_profile() {
    if [ -z "${1-}" ] || [ ! -f "${1}" ]; then
      return 1
    fi
    echo "${1}"
  }

  install_quick_setup() {

    INSTALL_DIR="$HOME/.quick_setup"
    echo Installing to $INSTALL_DIR
    WORKING_DIR="$(pwd)"
    PROFILE_STRING="export QUICK_SETUP_DIR=\"\$HOME/.quick_setup\"\n[ -s \"\$QUICK_SETUP_DIR/setup\" ] && . \"\$QUICK_SETUP_DIR/setup\""
    PROFILE=$(detect_profile)

    if [ -z "${PROFILE-}" ] ; then
      local TRIED_PROFILE
      if [ -n "${PROFILE}" ]; then
        TRIED_PROFILE="${NVM_PROFILE} (as defined in \$PROFILE), "
      fi
      echo "Profile not found. Tried ${TRIED_PROFILE-}~/.bashrc, ~/.bash_profile, ~/.zshrc, and ~/.profile."
      echo "Create one of them and run this script again"
      echo "OR"
      echo "Append the following lines to the correct file yourself:"
      echo ""
      command printf "${PROFILE_STRING}"
      return
    fi

    if [ ! -d "$INSTALL_DIR" ]; then
      mkdir $INSTALL_DIR

      cd $INSTALL_DIR

      git clone git@github.com:kolyaventuri/quick_project_setup.git . > /dev/null 2>&1

      cd $WORKING_DIR

      echo "Done installing!"
      echo ""

      if [[ $(cat $PROFILE) != *"$PROFILE_STRING"* ]]; then
        command printf "\n# Quick Setup Script\n" >> $PROFILE
        command printf "${PROFILE_STRING}" >> $PROFILE
      fi

      echo "Script installed to $PROFILE"
      echo ""
      echo "Restart terminal or run the following command to use quick setup now"
      echo ""
      command printf "${PROFILE_STRING}"

    else
      echo "ERR: Quick setup already installed."
      echo "Run rm -r $INSTALL_DIR"
    fi
  }

  install_quick_setup
} # ensure entire script downloaded