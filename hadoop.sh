#!/bin/bash

cat /hosts > /etc/hosts

/usr/sbin/sshd

mkdir -p /hdfs/namenode /hdfs/datanode /hadoop/tmp/

if [[ $HOSTNAME == "master" ]]; then
    if [[ $FORMAT == "true" ]]; then
        $HADOOP_PREFIX/bin/hdfs namenode -format
    fi
    $HADOOP_PREFIX/sbin/start-dfs.sh
    $HADOOP_PREFIX/sbin/start-yarn.sh
    $HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh start historyserver
fi