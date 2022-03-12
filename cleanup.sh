#!/usr/bin/env bash

set -e

. "./common.sh"

rm -rf "$AGE_GIT_DIR"
rm -rf "$AGE_SVN_DIR"
rm -f "$AGE_COMMIT_FILE"
#rm -f "$AGE_EMAIL_FILE"