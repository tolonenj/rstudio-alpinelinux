#!/bin/bash
set -e

TTYD_ARGS="-W -I /var/www/localhost/htdocs/index.html -p8787"

# Create user account
adduser -D --shell=/bin/bash $USERNAME

# Add a password to the user
echo "$USERNAME:$PASSWORD" | chpasswd &> /dev/null

# Set timezone
ln -sf "/usr/share/zoneinfo/$TZ" /etc/localtime
echo $TZ > /etc/timezone

# Start lighttpd server
lighttpd -f /etc/lighttpd/lighttpd.conf

# Start ttyd
exec ttyd $TTYD_ARGS login "$@"
