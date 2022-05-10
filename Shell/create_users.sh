#!/bin/bash
#
# Create multiple users at once.

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

    if [ $? -ne 0 ]; then

        # User doesn't exist
        home="/home/${user}"
        useradd -d "${home}" -m -s /bin/bash "${user}"

        # Set user's initial password
        password="hello@${user}"
        echo "${user}:${password}" | chpasswd

        # Test if user creates success
        test_users "${user}"

        if [ $? -eq 0 ]; then
            printf "${FORMAT}" "${user}" ": create success"
        else
            printf "${FORMAT}" "${user}" ": create failed"
        fi
    else
        # User already exists
        printf "${FORMAT}" "${user}" ": already exist"
    fi
done
