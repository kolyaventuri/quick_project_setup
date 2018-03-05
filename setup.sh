#!/bin/sh

LANG=$1
CURR_PATH=${2-$(pwd)}
SOURCE="${BASH_SOURCE[0]}"
DIR="$( dirname "$SOURCE" )"

# for filename in $DIR/modules/**/setup.sh; do
#   echo "$filename"
# done

DIR_LIST="$(ls -d $DIR/modules/* | rev | cut -f1 -d'/' | rev)"
DIRS=($DIR_LIST)
DO_BREAK=0
LOAD_LANG=NULL

for dir in "${DIRS[@]}"; do
    if [ "$dir" == "$LANG" ]; then
      LOAD_LANG=$LANG
      break # The language exists, load the module
    else
      if [ $DO_BREAK -eq 1 ]; then
        break # We found the module already
      fi

      for filename in "$DIR/modules/**/.alias"; do
        # Look through each module folder for .alias files

        file="$(ls $filename | cut -f4 -d '/')"
        if [ "$file" == ".alias" ]; then
          # Get the alias file
          ALIASES=$(cat $filename) # Read in aliases
          for alias in "${ALIASES[@]}"; do
            if [ "$alias" == "$LANG" ]; then # Check against what we are looking for
              DO_BREAK=1 # Set break flag
              LOAD_LANG=$dir # Set the language name (directory)
              break
            fi
          done

          if [ $DO_BREAK -eq 1 ]; then # Stop looking through files if we have it
            break
          fi
        fi
      done
    fi
done
echo $LOAD_LANG
echo $LANG
$DIR/modules/$LOAD_LANG/setup.sh
$DIR/helpers/git.sh