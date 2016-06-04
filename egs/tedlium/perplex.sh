#!/bin/bash

set -e
export POCOLM_ROOT=$(cd ../..; pwd -P)
export PATH=$PATH:$POCOLM_ROOT/scripts


export PATH=$PATH:/netshr/kaldi/tools/srilm/bin/i686-m64/
#for order in 3 4 5; do ngram -order $order -unk -lm data/arpa/150000_${order}gram_unpruned.arpa.gz -ppl cantab-TEDLIUM/text-test ; done

# Pocolm trained on Cantab-TEDLIUM corpus based on same vocab as Cantab ie 150000 words
# Perplexity calculated using the text of the audio/text test set from Kaldi tedlium recipe
# consisting in 1155 sentences and 27512 words
# order 3
# file cantab-TEDLIUM/text-test: 1155 sentences, 27512 words, 0 OOVs
# 0 zeroprobs, logprob= -65252.2 ppl= 188.892 ppl1= 235.382
# order 4
# file cantab-TEDLIUM/text-test: 1155 sentences, 27512 words, 0 OOVs
# 0 zeroprobs, logprob= -64436.3 ppl= 176.91 ppl1= 219.845
# order 5
# file cantab-TEDLIUM/text-test: 1155 sentences, 27512 words, 0 OOVs
# 0 zeroprobs, logprob= -64315.9 ppl= 175.208 ppl1= 217.641

# Below is SRILM baseline for cantab-TEDLIUM corpus using the text of the audio/text test set from Kaldi tedlium recipe
# consisting in 1155 sentences and 27512 words
# results based on the cantab-TEDLIUM dictionary 150000 words.
# /netshr/pocolm/egs/tedlium$ ../../scripts/srilm_baseline.sh --dev-set-file cantab-TEDLIUM/text-test
# Perplexity for trigram LM:
# file cantab-TEDLIUM/text-test: 1155 sentences, 27512 words, 0 OOVs
# 0 zeroprobs, logprob= -65622.7 ppl= 194.598 ppl1= 242.795
# Perplexity for 4-gram LM:
# file cantab-TEDLIUM/text-test: 1155 sentences, 27512 words, 0 OOVs
# 0 zeroprobs, logprob= -65059.6 ppl= 185.992 ppl1= 231.617
# Perplexity for 5-gram LM:
# file cantab-TEDLIUM/text-test: 1155 sentences, 27512 words, 0 OOVs
# 0 zeroprobs, logprob= -64946.7 ppl= 184.313 ppl1= 229.439


# SRILM Pruning impact on perplexity
# ORDER 3
#ngram -unk -lm data/srilm/lm.o3g.kn.gz -prune 1e-7 -order 3 -write-lm data/srilm/lm.o3g.pruned1e7.gz
#ngram -unk -lm data/srilm/lm.o3g.kn.gz -prune 5e-8 -order 3 -write-lm data/srilm/lm.o3g.pruned5e8.gz
#ngram -unk -lm data/srilm/lm.o3g.kn.gz -prune 1e-8 -order 3 -write-lm data/srilm/lm.o3g.pruned1e8.gz
#ngram -unk -lm data/srilm/lm.o3g.kn.gz -prune 1e-9 -order 3 -write-lm data/srilm/lm.o3g.pruned1e9.gz
#ngram -unk -lm data/srilm/lm.o3g.kn.gz -prune 1e-10 -order 3 -write-lm data/srilm/lm.o3g.pruned1e10.gz
#ngram -order 3 -unk -lm data/srilm/lm.o3g.pruned1e7.gz -ppl cantab-TEDLIUM/text-test
#ngram -order 3 -unk -lm data/srilm/lm.o3g.pruned5e8.gz -ppl cantab-TEDLIUM/text-test
#ngram -order 3 -unk -lm data/srilm/lm.o3g.pruned1e8.gz -ppl cantab-TEDLIUM/text-test
#ngram -order 3 -unk -lm data/srilm/lm.o3g.pruned1e9.gz -ppl cantab-TEDLIUM/text-test
#ngram -order 3 -unk -lm data/srilm/lm.o3g.pruned1e10.gz -ppl cantab-TEDLIUM/text-test
#file cantab-TEDLIUM/text-test: 1155 sentences, 27512 words, 0 OOVs
#0 zeroprobs, logprob= -67368.9 ppl= 223.898 ppl1= 281.002
#file cantab-TEDLIUM/text-test: 1155 sentences, 27512 words, 0 OOVs
#0 zeroprobs, logprob= -66739.2 ppl= 212.855 ppl1= 266.576
#file cantab-TEDLIUM/text-test: 1155 sentences, 27512 words, 0 OOVs
#0 zeroprobs, logprob= -65995.5 ppl= 200.512 ppl1= 250.489
#file cantab-TEDLIUM/text-test: 1155 sentences, 27512 words, 0 OOVs
#0 zeroprobs, logprob= -65670.6 ppl= 195.348 ppl1= 243.77
#file cantab-TEDLIUM/text-test: 1155 sentences, 27512 words, 0 OOVs
#0 zeroprobs, logprob= -65620.8 ppl= 194.568 ppl1= 242.757


# ORDER 4
#ngram -unk -lm data/srilm/lm.o4g.kn.gz -prune 1e-7 -order 4 -write-lm data/srilm/lm.o4g.pruned1e7.gz
#ngram -unk -lm data/srilm/lm.o4g.kn.gz -prune 1e-8 -order 4 -write-lm data/srilm/lm.o4g.pruned1e8.gz
#ngram -unk -lm data/srilm/lm.o4g.kn.gz -prune 1e-9 -order 4 -write-lm data/srilm/lm.o4g.pruned1e9.gz
#ngram -unk -lm data/srilm/lm.o4g.kn.gz -prune 1e-10 -order 4 -write-lm data/srilm/lm.o4g.pruned1e10.gz
#ngram -order 4 -unk -lm data/srilm/lm.o4g.pruned1e7.gz -ppl cantab-TEDLIUM/text-test
#ngram -order 4 -unk -lm data/srilm/lm.o4g.pruned1e8.gz -ppl cantab-TEDLIUM/text-test
#ngram -order 4 -unk -lm data/srilm/lm.o4g.pruned1e9.gz -ppl cantab-TEDLIUM/text-test
#ngram -order 4 -unk -lm data/srilm/lm.o4g.pruned1e10.gz -ppl cantab-TEDLIUM/text-test
#file cantab-TEDLIUM/text-test: 1155 sentences, 27512 words, 0 OOVs
#0 zeroprobs, logprob= -67523 ppl= 226.686 ppl1= 284.649
#file cantab-TEDLIUM/text-test: 1155 sentences, 27512 words, 0 OOVs
#0 zeroprobs, logprob= -65483.1 ppl= 192.428 ppl1= 239.975
#file cantab-TEDLIUM/text-test: 1155 sentences, 27512 words, 0 OOVs
#0 zeroprobs, logprob= -65017.1 ppl= 185.358 ppl1= 230.795
#file cantab-TEDLIUM/text-test: 1155 sentences, 27512 words, 0 OOVs
#0 zeroprobs, logprob= -65028.4 ppl= 185.527 ppl1= 231.014




