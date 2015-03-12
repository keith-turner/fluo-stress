#!/bin/bash

BIN_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ ! -f $BIN_DIR/../conf/env.sh ] 
then
  . $BIN_DIR/../conf/env.sh.example
else
  . $BIN_DIR/../conf/env.sh
fi

if [ "$#" -ne 3 ]; then
    echo "Usage : $0 <input dir> <work dir> <num reducers>"
    exit 1
fi

LJO="-libjars $LIB_JARS"
yarn jar $STRESS_JAR io.fluo.stress.trie.Init -Dmapreduce.job.reduces=$3 $LJO $FLUO_PROPS $1 $2

