#!/bin/bash

# Generate a bunch of random test data

mkdir -p data/16
dd if=/dev/urandom of=data/16/00 bs=1M count=256
dd if=/dev/urandom of=data/16/01 bs=1M count=256
dd if=/dev/urandom of=data/16/02 bs=1M count=256
dd if=/dev/urandom of=data/16/03 bs=1M count=256
dd if=/dev/urandom of=data/16/04 bs=1M count=256
dd if=/dev/urandom of=data/16/05 bs=1M count=256
dd if=/dev/urandom of=data/16/06 bs=1M count=256
dd if=/dev/urandom of=data/16/07 bs=1M count=256
dd if=/dev/urandom of=data/16/08 bs=1M count=256
dd if=/dev/urandom of=data/16/09 bs=1M count=256
dd if=/dev/urandom of=data/16/10 bs=1M count=256
dd if=/dev/urandom of=data/16/11 bs=1M count=256
dd if=/dev/urandom of=data/16/12 bs=1M count=256
dd if=/dev/urandom of=data/16/13 bs=1M count=256
dd if=/dev/urandom of=data/16/14 bs=1M count=256
dd if=/dev/urandom of=data/16/15 bs=1M count=256
dd if=/dev/urandom of=data/16/16 bs=1M count=256
dd if=/dev/urandom of=data/16/17 bs=1M count=256
dd if=/dev/urandom of=data/16/18 bs=1M count=256
dd if=/dev/urandom of=data/16/19 bs=1M count=256

mkdir -p data/2
dd if=/dev/urandom of=data/2/00 bs=1M count=2048
dd if=/dev/urandom of=data/2/01 bs=1M count=2048
