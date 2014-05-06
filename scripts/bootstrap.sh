#!/bin/bash

# No password for sudo
echo "%sudo ALL = NOPASSWD: ALL" >> /etc/sudoers

# Public SSH key for vagrant user
mkdir /home/vagrant/.ssh
curl -s "https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub" -o /home/vagrant/.ssh/authorized_keys
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Install guest additions on next boot
cp /etc/rc.{local,local.bak} && cp /root/poststrap.sh /etc/rc.local

# Wait for disk
sync
