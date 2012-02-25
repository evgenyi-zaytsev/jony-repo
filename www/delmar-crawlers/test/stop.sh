#!/bin/bash

if [ "$1" != "" ]; then
    ps aux | grep $1 | grep -v grep | grep -v vim | awk '{print $2}' | xargs kill -9

sudo /etc/init.d/gearman-job-server restart
fi
#/etc/init.d/gearman-job-server restart
