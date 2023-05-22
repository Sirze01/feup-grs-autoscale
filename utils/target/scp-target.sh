#! /bin/bash
if [ $# -lt 4 ]
  then
    echo "Missing arguments - Use $(basename $0) send|get a|b src dest [-r]" 1>&2
    exit 1
fi

target=$(echo "$2" | tr '[:upper:]' '[:lower:]')
case $target in
    b)
        target_ip="theuser@192.168.88.101"
        ;;

    c)
        target_ip="theuser@192.168.88.102"
        ;;
    *)
        echo "Unknown host - use $(basename $0) b|c" 1>&2
        exit 1
        ;;
esac


SCP_COMMAND="scp -i $(dirname $0)/keys/gors-2122-2s-target.rsa"
operation=$(echo "$1" | tr '[:upper:]' '[:lower:]')

echo $operation
case $operation in
    get)
        cmd="$SCP_COMMAND $5 $target_ip:$3 $4"
        eval $cmd
        exit 0
        ;;

    send)
        cmd="$SCP_COMMAND $5 $3 $target_ip:$4"
        eval $cmd
        exit 0
        ;;
    *)
        echo "Unknown command" 1>&2
        exit 1
        ;;
esac

exit 0
