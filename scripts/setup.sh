#!/bin/bash -eux

echo "==> Giving ${SSH_USERNAME} sudo powers"
echo "${SSH_USERNAME}        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/sansforensics
chmod 440 /etc/sudoers.d/sansforensics

# Fix stdin not being a tty
if grep -q -E "^mesg n$" /root/.profile && sed -i "s/^mesg n$/tty -s \\&\\& mesg n/g" /root/.profile; then
  echo "==> Fixed stdin not being a tty."
fi
