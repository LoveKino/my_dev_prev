#!/bin/bash
CUR_DIR=$(cd `dirname $0`;pwd)
PROJECT_DIR=$(cd `dirname $0`;cd ../..;pwd)

[ ! -z $1 ] && PROJECT_DIR=$1

cd $PROJECT_DIR

cp $CUR_DIR/babelrc $PROJECT_DIR/.babelrc

npm i babel-cli --save-dev
npm i babel-preset-es2015 --save-dev
npm i babel-preset-stage-0 --save-dev
