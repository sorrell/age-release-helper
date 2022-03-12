##############
# Dynamic vars
##############
GPG_ID="some_committer@apache.org"
RELEASE_MGR="Jane Doe"
AGE_VERSION="0.0.0"
AGE_RC="rc"

##############
# Static vars
##############
NOTES_MD5=$(md5sum releaseNotes.md | awk '{print $1}')
GPG_SIG=$(gpg --fingerprint "$GPG_ID" | head -n 2 | tail -n 1)
BASE_DIR=$(pwd)
AGE_INCUBATING="apache-age-$AGE_VERSION-incubating"
AGE_GIT_DIR="git_$AGE_INCUBATING"
AGE_SVN_DIR="svn_age_release_$AGE_VERSION"
AGE_COMMIT_FILE="./git-commit-hash"
AGE_EMAIL_FILE="release_email_${AGE_VERSION}_${AGE_RC}.md"
SVN_COMMIT_MSG="Add release files for Apache age $AGE_VERSION.$AGE_RC"

function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo "Process Aborted" ; return  1 ;;
        esac
    done
}

ITALIC='[3m'
BOLD='[1m'
RED='[91m'
GREEN='[92m'
CYAN='[96m'
GRAY='[37m'
NC='[0m' # No Color