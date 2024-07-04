#!/bin/bash
set -euo pipefail

if ! [ -f /usr/abills/libexec/config.pl]; then
    exit 1;
else
    exec "$@"
fi