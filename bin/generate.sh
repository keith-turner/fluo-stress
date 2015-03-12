#!/bin/bash

BIN_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ ! -f $BIN_DIR/../conf/env.sh ] 
then
  . $BIN_DIR/../conf/env.sh.example
else
  . $BIN_DIR/../conf/env.sh
fi

LJO="-libjars $LIB_JARS"
yarn jar $STRESS_JAR io.fluo.stress.trie.Generate $LJO $@

