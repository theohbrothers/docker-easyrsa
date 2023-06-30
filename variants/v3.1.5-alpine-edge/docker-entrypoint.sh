#!/bin/sh

set -aeo pipefail

# Generate the command line. easy-rsa man: https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/README.quickstart.md
echo "Generating command line"
set "$EASYRSA/easyrsa" "$@"

# Exec
echo "easyrsa command line: $@"
exec "$@"