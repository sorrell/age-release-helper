#!/usr/bin/env bash

set -e

. "./common.sh"


. "./precheck.sh"
yes_or_no "$GREEN Ready to create assets and signatures? $NC" && . "./createAssetsSigs.sh"
cd $BASE_DIR
yes_or_no "$GREEN Ready to create (not send) the email? $NC" && . "./createEmail.sh"
cd $BASE_DIR
yes_or_no "$GREEN Ready to delete the repos and files we just created? $NC" && . "./cleanup.sh"