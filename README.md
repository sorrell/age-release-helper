# AGE Release Helper
This set of scripts is designed to automate the release process for [Apache AGE](https://github.com/apache/incubator-age/)

There are 5 primary scripts:

- `exec.sh` - This script will execute all subsequent scripts
- `precheck.sh` - This script checks to make sure you have updated all of the necessary variables and files for a valid release
- `createAssetsSigs.sh` - This script clones the current release from Github (**Note:** This assumes we have followed the same naming convention and already created this branch at Github). It will then create the signature file, checksum, and tarball for the release, clone the svn repository, and add + commit the release files.
- `createEmail.sh` - This file creates a new file `release_email_{VERSION}.md` that you can copy/paste to email the dev mailing list. You should review this to ensure it has all of the necessary fields filled out. **This will not send an email**
- `cleanup.sh` - This file deletes the repos we've cloned/updated

## How to use

1. You must update the following variables in `common.sh` to valid values. For example: 
```
GPG_ID="sorrell@apache.org"
RELEASE_MGR="Nick Sorrell"
AGE_VERSION=1.0.0
AGE_RC="rc0"
```

2. You must update the `releaseNotes.md` file to contain valid release notes 

3. Run the `exec.sh` script to run the process  