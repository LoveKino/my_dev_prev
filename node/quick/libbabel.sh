#!/bin/bash

ROOT_DIR=$(cd `dirname $0`;cd ../..;pwd)
PROJECT_DIR=$(cd `dirname $0`;cd ../../..;pwd)

[ ! -z $1 ] && PROJECT_DIR=$1

$ROOT_DIR/node/stdFileTree.sh $PROJECT_DIR

$ROOT_DIR/node/link.sh $PROJECT_DIR

$ROOT_DIR/node/test.sh $PROJECT_DIR

$ROOT_DIR/node/babel.sh $PROJECT_DIR

$ROOT_DIR/node/gulp.sh libbabel $PROJECT_DIR
