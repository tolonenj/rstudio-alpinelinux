#!/bin/sh

set -e

# Configure commands available
apk update \
&& apk add --no-cache\
    tini\
    ttyd\
    lighttpd\
    bash\
    nano\
&& apk del\
   apk-tools

# Configure user settings
mkdir /etc/skel \
&& echo 'export EDITOR="nano"
export PS1="\w \$ "' >> /etc/skel/.profile\
&& echo ',-.___,-.
\_/_ _\_/
  )O_O(        Welcome to Noppe powered
 { (_) }             Alpine Linux
  `-^-´   hjw' > /etc/motd
