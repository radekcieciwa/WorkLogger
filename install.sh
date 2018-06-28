#!/bin/sh
#
# Author Radoslaw Cieciwa <radekcieciwa@gmail.com>
#
# Description
# This script will install post-commit hooks to your logs file.
#

THISSCRIPT=`basename $0`
VERBOSE=true

_print_help() {
	cat << EOF
Usage: $THISSCRIPT [ repo directory ] [ log file_name ]

Examples:
  $THISSCRIPT ../repo-example ../repo-example.log
EOF
}

_generate_post_commit() {
  FILE_NAME=$1
  echo "#!/bin/sh"
  echo "git log -1 --date=short --pretty="%s [%cd]" >> $FILE_NAME"
}

_execute() {
  POST_COMMIT_HOOK_PATH="$1/.git/hooks/post-commit"
  CURRENT_PATH=`pwd`
  LOG_FILE="$2.log"
  POST_COMMIT_SCRIPT="$CURRENT_PATH/.post_commit_$2"
  _generate_post_commit $LOG_FILE > $POST_COMMIT_SCRIPT
  touch "$CURRENT_PATH/$LOG_FILE"
  ln -s -f $POST_COMMIT_SCRIPT $POST_COMMIT_HOOK_PATH
}

if [ "$1" = "--help" -o "$1" = "-help" -o "$1" = "-h" ]; then
	 _print_help
else
  if [ "$#" -ne 2 ]; then
    _print_help
    exit 1
  fi

  REPO_PATH=$1
  REPO_NAME=$2
  _execute $REPO_PATH $REPO_NAME
fi
