#!/bin/bash

Usage() {
    echo "Usage: $0 {-x|-y optarg1}"
    exit 1
}


while getopts "x:y:" options 2>/dev/null
do
    case $options in
        x) echo "X nom" ;;
        y) echo "Y nom + $OPTARG" ;;
        \?) Usage ;;
        *) Usage ;;
    esac
done
echo "OPTIND: $OPTIND"
shift $(expr $OPTIND - 1)

if [ $# -ne 1 ]; then
    Usage
fi

echo "$# : $@"