#!/bin/bash
key=<path-to-ssh-key>
user=<erda-username>
erdadir=<erda-dir-to-mount>
mnt=<mount-location>
if [ -f "$key" ]
then
    mkdir -p ${mnt}
    sshfs ${user}@io.erda.dk:${erdadir} ${mnt} -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 -o IdentityFile=${key}
else
    echo "'${key}' is not an ssh key"
fi