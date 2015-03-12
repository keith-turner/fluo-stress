#!/bin/bash

BIN_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ ! -f $BIN_DIR/../conf/env.sh ] 
then
  . $BIN_DIR/../conf/env.sh.example
else
  . $BIN_DIR/../conf/env.sh
fi

if [ "$#" -lt 2 ]; then
    echo "Usage : $0 <num reducers> <input dir>{ <input dir>}"
    exit 1
fi


LJO="-libjars $LIB_JARS"
yarn jar $STRESS_JAR io.fluo.stress.trie.Unique -Dmapreduce.job.reduces=$1 $LJO ${@:2}

