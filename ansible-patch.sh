#!/bin/sh

# ./ansible-patch.sh all -m shell -a 'hostname'

TARGET=$1
shift

echo "==================="
echo ansible tag_Role_$TARGET  "$@"
echo "==================="

ansible tag_Role_$TARGET  "$@"
