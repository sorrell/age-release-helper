#!/usr/bin/env bash

set -e

. "./common.sh"

AGE_GIT_HASH=$(cat $AGE_COMMIT_FILE)
AGE_REL_NOTES=$(cat "./releaseNotes.md")

awk -v version="$AGE_VERSION" '{gsub("{{AGE_VERSION}}", version, $0); print}' emailTemplate.md |
  awk -v rc="$AGE_RC" '{gsub("{{AGE_RC}}", rc, $0); print}' |
  awk -v hash="$AGE_GIT_HASH" '{gsub("{{AGE_GIT_HASH}}", hash, $0); print}' |
  awk -v relmgr="$RELEASE_MGR" '{gsub("{{RELEASE_MGR}}", relmgr, $0); print}' | 
  awk -v gpgsig="$GPG_SIG" '{gsub("{{GPG_SIG}}", gpgsig, $0); print}' |
  awk -v relnotes="$AGE_REL_NOTES" '{gsub("{{RELEASE_NOTES}}", relnotes, $0); print}' \
  > "$AGE_EMAIL_FILE"
