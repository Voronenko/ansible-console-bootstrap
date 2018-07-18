#!/bin/sh

# ./ansible-play-patch.sh $target $play

if [ -z $1 ]
then
  echo ansible-patch-play.sh TARGET
  echo where target can be:
  echo ansible-patch-play.sh ap-southeast-1                         All instances in region
  echo ansible-patch-play.sh ap-southeast-1a                        All instances in regions availability group
  echo ansible-patch-play.sh i-00b3fc96c387fa286                    InstanceId
  echo ansible-patch-play.sh key_DEVOPS_SOUTHEAST                   All instances managed by key DEVOPS_SOUTHEAST
  echo ansible-patch-play.sh security_group_bastion                 All instances in security group bastion
  echo ansible-patch-play.sh tag_Environment_live                   All instances with tag Environment=live
  echo ansible-play-patch.sh "tag_Role_app:&tag_Environment_test"   All instances tagged both Role=app and Environment=test
  echo ansible-patch-play.sh type_t2_large                          All instances with size ts:large
  exit 1
fi

TARGET=$1
PLAY=${2:-patch_play.yml}
shift

echo "==================="
echo ansible-playbook $PLAY --extra-vars "targetfilter=${TARGET}" "$@"
echo "==================="

ansible-playbook $PLAY --extra-vars "targetfilter=${TARGET}" "$@"
