#!/bin/bash

# Runs Ephyra on the TREC 8-11 questions.
# Usage: EphyraTREC8To11.sh {trec8, trec9, trec10, trec11} unique_ID index_dir
#                           [assert_dir]

# The '-server' option of the Java VM improves the runtime of Ephyra.
# We recommend using 'java -server' if your VM supports this option.

export CLASSPATH=bin:lib/ml/maxent.jar:lib/ml/minorthird.jar:lib/nlp/jwnl.jar:lib/nlp/lingpipe.jar:lib/nlp/opennlp-tools.jar:lib/nlp/plingstemmer.jar:lib/nlp/snowball.jar:lib/nlp/stanford-ner.jar:lib/nlp/stanford-parser.jar:lib/nlp/stanford-postagger.jar:lib/qa/javelin.jar:lib/search/bing-search-java-sdk.jar:lib/search/googleapi.jar:lib/search/indri.jar:lib/search/yahoosearch.jar:lib/util/commons-logging.jar:lib/util/gson.jar:lib/util/htmlparser.jar:lib/util/log4j.jar:lib/util/trove.jar
export INDRI_INDEX=$3
export ASSERT=$4

cd ..

java -server -Xms1000m -Xmx1400m -Djava.library.path=lib/search/ \
     info.ephyra.trec.EphyraTREC8To11 res/testdata/trec/"$1"questions \
     res/testdata/trec/"$1"patterns log=log/"$1_$2"
