#!/bin/bash

# Generate a bunch of random test data

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
