# A git hook file has to be excutable.
PROJ_DIR=$PWD
FILE="$PROJ_DIR/.git/hooks/pre-commit"
chmod u+x $FILE
