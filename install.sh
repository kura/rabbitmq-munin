#!/bin/bash
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "chmod"
chmod +x plugins/rabbitmq*
echo "done"
echo "chown"
chown root:root plugins/rabbitmq*
echo "done"
echo "move"
mv plugins/rabbitmq* /usr/share/munin/plugins/
echo "done"
echo "symlink"
ln -s /usr/share/munin/plugins/plugins/rabbitmq-connections /etc/munin/plugins/plugins/rabbitmq-connections
ln -s /usr/share/munin/plugins/plugins/rabbitmq-consumers /etc/munin/plugins/plugins/rabbitmq-consumers
ln -s /usr/share/munin/plugins/plugins/rabbitmq-messages /etc/munin/plugins/plugins/rabbitmq-messages
ln -s /usr/share/munin/plugins/plugins/rabbitmq-messages_unacknowledged /etc/munin/plugins/plugins/rabbitmq-messages_unacknowledged
ln -s /usr/share/munin/plugins/plugins/rabbitmq-messages_uncommitted /etc/munin/plugins/plugins/rabbitmq-messages_uncommitted
ln -s /usr/share/munin/plugins/plugins/rabbitmq-queue_memory /etc/munin/plugins/plugins/rabbitmq-queue_memory
echo "done"
echo "restart munin-node"
/etc/init.d/munin-node restart
echo "done"
echo "/etc/munin/plugins/plugins/rabbitmq-connections"
/etc/munin/plugins/plugins/rabbitmq-connections
echo
echo "/etc/munin/plugins/plugins/rabbitmq-consumers"
/etc/munin/plugins/plugins/rabbitmq-consumers
echo
echo "/etc/munin/plugins/plugins/rabbitmq-messages"
/etc/munin/plugins/plugins/rabbitmq-messages
echo
echo "/etc/munin/plugins/plugins/rabbitmq-messages_unacknowledged"
/etc/munin/plugins/plugins/rabbitmq-messages_unacknowledged
echo
echo "/etc/munin/plugins/plugins/rabbitmq-messages_uncommitted"
/etc/munin/plugins/plugins/rabbitmq-messages_uncommitted
echo
echo "/etc/munin/plugins/plugins/rabbitmq-queue_memory"
/etc/munin/plugins/plugins/rabbitmq-queue_memory
echo
echo "it works!"
exit 0

