#!/bin/sh
set -e
ssh-keygen -A
/usr/sbin/sshd  
exec /sbin/tini -- /usr/lib/frr/docker-start
