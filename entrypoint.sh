#!/bin/bash
set -e

TTYD_ARGS="-p8787 -W -I /var/www/localhost/htdocs/index.html"

# Create user account
adduser -D --shell=/bin/bash $USERNAME

# Add a password to the user
echo "$USERNAME:$PASSWORD" | chpasswd

# Set timezone
ln -sf "/usr/share/zoneinfo/$TZ" /etc/localtime
echo $TZ > /etc/timezone

# Start lighttpd server
lighttpd -f /etc/lighttpd/lighttpd.conf

# Start ttyd
exec ttyd $TTYD_ARGS login "$@"
