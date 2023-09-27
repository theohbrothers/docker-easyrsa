#!/bin/sh
set -eu

if [ $# -gt 0 ]; then
    # Get all subcommands. 'help' is also a subcommand
    SUBCOMMANDS=$( easyrsa help | awk "/init-pki/,/^$/" | awk '{print $1}' | awk NF ; echo help )
    if echo "$SUBCOMMANDS" | grep "^$1$"; then
        set "easyrsa" "$@"
        echo "Executing: $@"
        exec "$@"
    fi
else
    exec "easyrsa" "$@"
fi

exec "$@"
