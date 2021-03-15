#!/bin/bash

# Generate a bunch of random test data

mkdir -p data/128
dd if=/dev/urandom of=data/128/00 bs=1M count=128
dd if=/dev/urandom of=data/128/01 bs=1M count=128
dd if=/dev/urandom of=data/128/02 bs=1M count=128
dd if=/dev/urandom of=data/128/03 bs=1M count=128
dd if=/dev/urandom of=data/128/04 bs=1M count=128
dd if=/dev/urandom of=data/128/05 bs=1M count=128
dd if=/dev/urandom of=data/128/06 bs=1M count=128
dd if=/dev/urandom of=data/128/07 bs=1M count=128
dd if=/dev/urandom of=data/128/08 bs=1M count=128
dd if=/dev/urandom of=data/128/09 bs=1M count=128
dd if=/dev/urandom of=data/128/10 bs=1M count=128
dd if=/dev/urandom of=data/128/11 bs=1M count=128
dd if=/dev/urandom of=data/128/12 bs=1M count=128
dd if=/dev/urandom of=data/128/13 bs=1M count=128
dd if=/dev/urandom of=data/128/14 bs=1M count=128
dd if=/dev/urandom of=data/128/15 bs=1M count=128
dd if=/dev/urandom of=data/128/16 bs=1M count=128
dd if=/dev/urandom of=data/128/17 bs=1M count=128
dd if=/dev/urandom of=data/128/18 bs=1M count=128
dd if=/dev/urandom of=data/128/19 bs=1M count=128
dd if=/dev/urandom of=data/128/20 bs=1M count=128
dd if=/dev/urandom of=data/128/21 bs=1M count=128
dd if=/dev/urandom of=data/128/22 bs=1M count=128
dd if=/dev/urandom of=data/128/23 bs=1M count=128
dd if=/dev/urandom of=data/128/24 bs=1M count=128
dd if=/dev/urandom of=data/128/25 bs=1M count=128
dd if=/dev/urandom of=data/128/26 bs=1M count=128
dd if=/dev/urandom of=data/128/27 bs=1M count=128
dd if=/dev/urandom of=data/128/28 bs=1M count=128
dd if=/dev/urandom of=data/128/29 bs=1M count=128
dd if=/dev/urandom of=data/128/30 bs=1M count=128
dd if=/dev/urandom of=data/128/31 bs=1M count=128

mkdir -p data/256
dd if=/dev/urandom of=data/256/00 bs=1M count=256
dd if=/dev/urandom of=data/256/01 bs=1M count=256
dd if=/dev/urandom of=data/256/02 bs=1M count=256
dd if=/dev/urandom of=data/256/03 bs=1M count=256
dd if=/dev/urandom of=data/256/04 bs=1M count=256
dd if=/dev/urandom of=data/256/05 bs=1M count=256
dd if=/dev/urandom of=data/256/06 bs=1M count=256
dd if=/dev/urandom of=data/256/07 bs=1M count=256
dd if=/dev/urandom of=data/256/08 bs=1M count=256
dd if=/dev/urandom of=data/256/09 bs=1M count=256
dd if=/dev/urandom of=data/256/10 bs=1M count=256
dd if=/dev/urandom of=data/256/11 bs=1M count=256
dd if=/dev/urandom of=data/256/12 bs=1M count=256
dd if=/dev/urandom of=data/256/13 bs=1M count=256
dd if=/dev/urandom of=data/256/14 bs=1M count=256
dd if=/dev/urandom of=data/256/15 bs=1M count=256

mkdir -p data/512
dd if=/dev/urandom of=data/512/00 bs=1M count=512
dd if=/dev/urandom of=data/512/01 bs=1M count=512
dd if=/dev/urandom of=data/512/02 bs=1M count=512
dd if=/dev/urandom of=data/512/03 bs=1M count=512
dd if=/dev/urandom of=data/512/04 bs=1M count=512
dd if=/dev/urandom of=data/512/05 bs=1M count=512
dd if=/dev/urandom of=data/512/06 bs=1M count=512
dd if=/dev/urandom of=data/512/07 bs=1M count=512

mkdir -p data/2048
dd if=/dev/urandom of=data/2048/00 bs=1M count=2048
dd if=/dev/urandom of=data/2048/01 bs=1M count=2048

mkdir -p data/4098
dd if=/dev/urandom of=data/4098/00 bs=1M count=4098