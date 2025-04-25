@'
#!/bin/sh
set -eu

if [ $# -gt 0 ]; then
    # Get all subcommands. 'help' is also a subcommand
    SUBCOMMANDS=$( easyrsa help | awk "/init-pki/,/^$/" | awk '{print $1}' | awk NF ; echo help )
    if echo "$SUBCOMMANDS" | grep "^$1$" > /dev/null; then
        exec "easyrsa" "$@"
    fi
fi

exec "$@"

'@
