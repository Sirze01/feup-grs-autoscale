#!/bin/bash
if [ -z "$1" ]
  then
    echo "No argument supplied - Use b|c" 1>&2
    exit 1
fi

SSH_COMMAND="ssh -i $(dirname $0)/keys/gors-2122-2s-target.rsa"
target=$(echo "$1" | tr '[:upper:]' '[:lower:]')


case $target in
    b)
        eval "$SSH_COMMAND theuser@192.168.88.101"
        exit 0
        ;;

    c)
        eval "$SSH_COMMAND theuser@192.168.88.102"
        exit 0
        ;;
    *)
        echo "Unknown host - use $(basename $0) b|c" 1>&2
        exit 1
        ;;
esac

exit 0
