@'
#!/bin/sh
set -eu

if [ $# -gt 0 ]; then
    # Get all subcommands. 'help' is also a subcommand
    SUBCOMMANDS=$( easyrsa | awk "/^'help'/,/^DIRECTORY/" | grep -vE "^'help'|^DIRECTORY|^\s*$" | awk '{print $1}'; echo help )
    if echo "$SUBCOMMANDS" | grep "^$1$"; then
        set "easyrsa" "$@"
        echo "Executing: $@"
        exec "$@"
    fi
else
    exec "easyrsa" "$@"
fi

exec "$@"

'@
