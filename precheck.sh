#!/usr/bin/env bash

set -e

. "./common.sh"


function checkCommitter {  
  if [[ "$GPG_ID" == "some_committer@apache.org" ]] ; then 
    echo -e "\t$RED [ERROR] Please update the GPG_ID field in common.sh $NC"
    exit 
  fi 
  echo -e "\t$GREEN[SUCCESS]  GPG_ID exists: $GPG_ID $NC"
}

function checkAGEVersion {  
  if [[ "$AGE_VERSION" == "0.0.0" ]] ; then 
    echo -e "\t$RED [ERROR] Please update the AGE_VERSION field in common.sh $NC"
    exit 
  fi 
  echo -e "\t$GREEN[SUCCESS]  AGE_VERSION exists: $AGE_VERSION $NC"
}

function checkAGERC {  
  if [[ "$AGE_RC" == "rc" ]] ; then 
    echo -e "\t$RED [ERROR] Please update the AGE_RC field in common.sh $NC"
    exit 
  fi 
  echo -e "\t$GREEN[SUCCESS]  AGE_RC exists: $AGE_RC $NC"
}

function checkRelMgr {  
  if [[ "$RELEASE_MGR" == "Jane Doe" ]] ; then 
    echo -e "\t$RED [ERROR] Please update the RELEASE_MGR field in common.sh $NC"
    exit 
  fi 
  echo -e "\t$GREEN[SUCCESS]  RELEASE_MGR exists: $RELEASE_MGR $NC"
}

function checkRelNotes {  
  if [[ "$NOTES_MD5" == "5cfb33dc0b82281f3641216eff7fd4a3" ]] ; then 
    echo -e "\t$RED [ERROR] Please update the release notes file: releaseNotes.md $NC"
    exit 
  fi 
  echo -e "\t$GREEN[SUCCESS]  RELEASE NOTES exist in releaseNotes.md $NC"
}

 

checkCommitter
checkRelMgr
checkAGEVersion
checkAGERC
checkRelNotes