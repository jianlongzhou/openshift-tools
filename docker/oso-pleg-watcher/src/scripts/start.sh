#!/bin/bash -e

# This is useful so we can debug containers running inside of OpenShift that are
# failing to start properly.

if [ "$OO_PAUSE_ON_START" = "true" ] ; then
  echo
  echo "This container's startup has been paused indefinitely because OO_PAUSE_ON_START has been set."
  echo
  while true; do
    sleep 10    
  done
fi

echo "Running config playbook"
ansible-playbook /root/config.yml

echo This container hosts the following applications:
echo
echo '/usr/local/bin/pleg-watcher'

echo
echo 'Always listen for PLEG events from sdjournal.'
echo '----------------'
/usr/local/bin/pleg-watcher
