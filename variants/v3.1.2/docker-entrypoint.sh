#!/bin/sh
set -eu

if [ $# -gt 0 ]; then
    # Get all subcommands. 'help' is also a subcommand
    SUBCOMMANDS=$( ./easyrsa | awk "/^'help'/,/^DIRECTORY/" | grep -vE "^'help'|^DIRECTORY|^\s*$" | awk '{print $1}'; echo help )
    if echo "$SUBCOMMANDS" | grep "^$1$"; then
        # Generate the command line. easy-rsa man: https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/README.quickstart.md
        echo "Generating command line"
        set "$EASYRSA/easyrsa" "$@"

        # Exec
        echo "easyrsa command line: $@"
        exec "$@"
    fi
else
    exec "$EASYRSA/easyrsa" "$@"
fi

exec "$@"
