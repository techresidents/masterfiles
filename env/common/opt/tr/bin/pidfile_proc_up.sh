#!/bin/bash

usage()
{
    echo "Check if process is up for a given pidfile."
    echo ""
    echo "Exits with return code 0 if pidfile exists and"
    echo "there exists a running process containing the"
    echo "string 'name'."
    echo "Otherwise exits with non-zero return code."
    echo ""
    echo "usage: `basename $0` <pidfile> <name>"
    exit 2
}

if [ $# -ne 2 ]
then
    usage
fi

pidfile=$1
name=$2
result=1

if [ -f $pidfile ]
then
    output=$(ps `cat $pidfile` |grep $name)
    result=$?
fi

echo $result
exit $result

