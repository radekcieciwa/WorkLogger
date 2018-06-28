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

_execute() {
  POST_COMMIT_HOOK_PATH="$1/.git/hooks/post-commit"
  SCRIPT=""
  ln -s -f $SCRIPT $POST_COMMIT_HOOK_PATH
}

if [ "$1" = "--help" -o "$1" = "-help" -o "$1" = "-h" ]; then
	 _print_help
else
	 REPO_PATH=$1
   LOG_FILE_NAME=$2
   _execute $REPO_PATH $LOG_FILE_NAME
fi
