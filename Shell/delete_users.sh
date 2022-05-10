#!/bin/bash
#
# Delete multiple users at once.

USER_LIST="alpha beta gamma delta epsilon zeta"
WIDTH=7
GREEN="\033[01;32m"
PLAIN="\033[00m"

FORMAT="${GREEN}%${WIDTH}s${PLAIN} %s\n"

test_users() {
    id "$@" &> /dev/null
}

for user in $(echo "${USER_LIST}"); do
    test_users "${user}"

    if [ $? -eq 0 ]; then

        # User exists
        userdel -r "${user}" &> /dev/null

        # Test if user deletes success
        test_users "$@"

        if [ $? -ne 0 ]; then
            printf "${FORMAT}" "${user}" ": delete success"
        else
            printf "${FORMAT}" "${user}" ": delete failed"
        fi
    else
        # User doesn't exist
        printf "${FORMAT}" "${user}" ": not found"
    fi
done
