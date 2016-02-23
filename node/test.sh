#!/bin/bash
PROJECT_DIR=$(cd `dirname $0`;cd ../..;pwd)

[ ! -z $1 ] && PROJECT_DIR=$1

cd $PROJECT_DIR

npm i mocha --save-dev

npm i istanbul --save-dev
