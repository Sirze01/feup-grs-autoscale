#! /bin/bash

if [ $# -lt 3 ]
  then
    echo "Missing arguments - Use $(basename $0) send|get src dest [-r]" 1>&2
    exit 1
fi


SCP_COMMAND="scp -i $(dirname $0)/keys/gors-2122-2s.rsa"
operation=$(echo "$1" | tr '[:upper:]' '[:lower:]')

echo $operation
case $operation in
    get)
        cmd="$SCP_COMMAND $4 theuser@192.168.109.156:$2 $3"
        eval $cmd
        exit 0
        ;;

    send)
        cmd="$SCP_COMMAND $4 $2 theuser@192.168.109.156:$3"
        eval $cmd
        exit 0
        ;;
    *)
        echo "Unknown command" 1>&2
        exit 1
        ;;
esac

exit 0
