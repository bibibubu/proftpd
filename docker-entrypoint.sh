#!/bin/sh

echo "Set proftpd user and password..."
USER_PWD_HASH=$(perl -e 'print crypt($ARGV[0], "password")' $USER_PWD)
useradd --create-home --password $USER_PWD_HASH $USER_NAME

echo "Changing proftpd SERVER_NAME..."
sed -i -e s/SERVER_NAME/$SERVER_NAME/ /etc/proftpd/proftpd.conf

# Run CMD
exec "$@"

