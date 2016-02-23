#!/bin/bash

# build node project standard file tree structure which contains compile procedure
# root
#    src                     // source code before compiling
#       index.js             // the entance for source code
#    lib                     // source code after compiling
#    test                    // test
#       src                  // source code for test
#           base.js          // base test for module
#                            // like 
#                            // import assert from 'assert'
#                            // import index from '../../index'
#                            // describe('base', () => {
#                            // });
#       lib                  // compiled code for test
#    index.js                // the entrance of this node module
#                            // content is 
#                            // module.exports = require('./lib/index.js')

PROJECT_DIR=$(cd `dirname $0`;cd ../..;pwd)

[ ! -z $1 ] && PROJECT_DIR=$1

cd $PROJECT_DIR

mkdir -p src lib test test/src test/lib
touch src/index.js test/src/base.js index.js

echo "/**
 * Use this file as your main file. Export your interface here.
 */

module.exports = {};" >> src/index.js

echo "// import 'babel-polyfill'; // if you need to some feature like async await, open this notation.

import assert from 'assert';
import index from '../../index';

describe('base', () => {
    it('base', () => {
    });
});
" >> test/src/base.js

echo "/**
 * This is the entance of your library.
 *
 * Make this file as simple as possible.
 *
 * Require you file from lib directory not the src directory.
 *
 * Using ES5 not ES7 here, because we won't compile this file.
 */

// require('babel-polyfill'); // if you need to some feature like async await, open this notation.

module.exports = require('./lib/index.js');" >> index.js
