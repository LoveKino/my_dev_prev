#!/bin/bash
CUR_DIR=$(cd `dirname $0`;pwd)
PROJECT_DIR=$(cd `dirname $0`;cd ../..;pwd)

GULP_TYPE='simplegulp';

[ ! -z $2 ] && PROJECT_DIR=$2

[ ! -z $1 ] && GULP_FILE=$1

cp $CUR_DIR/gulpfiles/$GULP_TYPE/gulpfile.js $PROJECT_DIR/gulpfile.js
$CUR_DIR/gulpfiles/$GULP_FILE/gulpfile.sh $PROJECT_DIR

cd $PROJECT_DIR
