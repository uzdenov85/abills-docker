#!/bin/bash
set -euo pipefail

if ! [ -f /usr/abills/libexec/config.pl ]; then
    cp /usr/abills/libexec/config.pl.default /usr/abills/libexec/config.pl;
    sed -i "s/localhost/${DB_HOST}/g" /usr/abills/libexec/config.pl;
    sed -i "s/sqlpassword/${DB_PASSWORD}/g" /usr/abills/libexec/config.pl;
    sed -i "s/test12345678901234567890/${SECRETKEY}/g" /usr/abills/libexec/config.pl
fi

exec "$@"