#!/usr/bin/env bash

set -e

. "./common.sh"

STOP_MSG="Pausing here - are you ready to commit? [y/n]"

cd $BASE_DIR

########
# Clone and package release
#######
git clone --depth 1 --branch "release/$AGE_VERSION" https://github.com/apache/incubator-age.git "$AGE_GIT_DIR"
git -C "$AGE_GIT_DIR" rev-parse HEAD > "$AGE_COMMIT_FILE"
rm -rf "$AGE_GIT_DIR/.git"
tar -czvf "$AGE_INCUBATING-src.tar.gz" "$AGE_GIT_DIR"

########
# Create signatures
#######
gpg --armor --default-key "$GPG_ID" --output "$AGE_INCUBATING-src.tar.gz.asc" --detach-sig "$AGE_INCUBATING-src.tar.gz"
sha512sum "$AGE_INCUBATING-src.tar.gz" >"$AGE_INCUBATING-src.tar.gz.sha512"

########
# Add files to svn
#######
svn co https://dist.apache.org/repos/dist/dev/incubator/age "$AGE_SVN_DIR"
cd "$AGE_SVN_DIR"
mkdir "$AGE_VERSION.$AGE_RC"
mv "../$AGE_INCUBATING-src.tar.gz" "$AGE_VERSION.$AGE_RC"
mv "../$AGE_INCUBATING-src.tar.gz.sha512" "$AGE_VERSION.$AGE_RC"
mv "../$AGE_INCUBATING-src.tar.gz.asc" "$AGE_VERSION.$AGE_RC"
svn add "$AGE_VERSION.$AGE_RC"

echo "$BOLD$CYAN*******************************"
echo "* Here is the current svn status"
echo "*******************************$NC"
svn status

echo "$BOLD$RED*******************************"
echo "* We're about to commit the release to svn"
echo "* Here's the commit message I plan to use: "
echo "*   $SVN_COMMIT_MSG "
echo "*******************************$NC"
yes_or_no "$GREEN$STOP_MSG $NC" && svn commit -m "$SVN_COMMIT_MSG"

