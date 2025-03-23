#!/bin/sh
set -e

# Configure commands available
apk update \
&& apk add --no-cache tini ttyd\
    bash\
    nano\
&& apk del\
   apk-tools

# List of commands that are not wanted
rm /bin/ping6

# Configure user's default settings
mkdir /etc/skel

cat > /etc/skel/.profile << EOF
export EDITOR="nano"
export PS1="\w \$ "
EOF

# Generate a welcome message and a brief disclaimer
echo '
,-.___,-.
\_/  _\_/
  )>_O(        Alpine Linux 3.21.3
 { (_) }       cat /readme
  `-^-´ hjw
' > /etc/motd

cat > /readme << EOF
This Linux environment has minimal resources and lacks appropriate
security measures. It is not designed to handle personal or classified
data and exists for educational purposes only.
EOF

chmod 444 /readme
