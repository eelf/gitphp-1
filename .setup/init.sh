#!/bin/bash

#first run, git home should be initialised
if [ ! -d "/home/git/.ssh" ]; then
    mkdir /home/git/.ssh && chmod 0700 /home/git/.ssh
    touch /home/git/.ssh/authorized_keys && chmod 0600 /home/git/.ssh/authorized_keys
    chown -R git.git /home/git
    ln -s /local/gitphp/ssh_serve.php /home/git/ssh_serve.php
    mkdir /local/gitphp/repositories
    chown git.git /local/gitphp/repositories
fi


#sendmail init
hostname=$(hostname)
localhost=$(head -n 1 /etc/hosts | awk '{print $2}')
echo "127.0.0.1 $localhost $localhost.localdomain $hostname $hostname.localdomain" >> /etc/hosts
service sendmail start
