#!/bin/bash
#
# Print all arguments that you input.

print_arguments() {
    echo "$# arguments:"

    while [ $# -gt 0 ]; do
        echo "$1" && shift 1
    done
}

print_arguments "$@"
