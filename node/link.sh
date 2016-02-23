#!/bin/bash
CUR_DIR=$(cd `dirname $0`;pwd)
PROJECT_DIR=$(cd `dirname $0`;cd ../..;pwd)

[ ! -z $1 ] && PROJECT_DIR=$1

cp $CUR_DIR/gitignore $PROJECT_DIR/.gitignore
cp $CUR_DIR/npmignore $PROJECT_DIR/.npmignore
cp $CUR_DIR/package.json $PROJECT_DIR/package.json
