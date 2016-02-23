#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd)

cd $CUR_DIR

rm -r testspace
mkdir testspace

mkdir -p testspace/node/stdFileTree
../node/stdFileTree.sh $CUR_DIR/testspace/node/stdFileTree

mkdir -p testspace/node/link
../node/link.sh $CUR_DIR/testspace/node/link

mkdir -p testspace/node/babel
../node/link.sh $CUR_DIR/testspace/node/babel
../node/babel.sh $CUR_DIR/testspace/node/babel

mkdir -p testspace/node/test
../node/link.sh $CUR_DIR/testspace/node/test
../node/test.sh $CUR_DIR/testspace/node/test

mkdir -p testspace/node/gulp
../node/link.sh $CUR_DIR/testspace/node/gulp
../node/gulp.sh simplegulp $CUR_DIR/testspace/node/gulp
