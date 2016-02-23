#!/bin/bash
PROJECT_DIR=$(cd `dirname $0`;cd ..;pwd)

[ ! -z $1 ] && PROJECT_DIR=$1

cd $PROJECT_DIR
echo "project dir is $PROJECT_DIR"
echo "are you sure cleaning your project, you will lost all work (yes/no)"

read answer
if [ "$answer" != "yes" ]; then
    echo "exit clean.sh"
    exit 1
fi
for f in $(find . -maxdepth 1); do
    [ ! $f == './.git' ] && 
    [ ! $f == './my_dev_prev' ] && 
    [ ! $f == '.' ] && 
    rm -r $f
done
