#!/bin/bash

BIN_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ ! -f $BIN_DIR/../conf/env.sh ] 
then
  . $BIN_DIR/../conf/env.sh.example
else
  . $BIN_DIR/../conf/env.sh
fi

yarn jar $STRESS_JAR io.fluo.stress.trie.Split $FLUO_PROPS $@

