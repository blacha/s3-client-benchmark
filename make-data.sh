#!/bin/bash

# Generate a bunch of random test data

mkdir -p data/small
mkdir -p data/big

dd if=/dev/urandom of=data/small/00 bs=1M count=256
dd if=/dev/urandom of=data/small/01 bs=1M count=256
dd if=/dev/urandom of=data/small/02 bs=1M count=256
dd if=/dev/urandom of=data/small/03 bs=1M count=256
dd if=/dev/urandom of=data/small/04 bs=1M count=256
dd if=/dev/urandom of=data/small/05 bs=1M count=256
dd if=/dev/urandom of=data/small/06 bs=1M count=256
dd if=/dev/urandom of=data/small/07 bs=1M count=256
dd if=/dev/urandom of=data/small/08 bs=1M count=256
dd if=/dev/urandom of=data/small/09 bs=1M count=256
dd if=/dev/urandom of=data/small/10 bs=1M count=256
dd if=/dev/urandom of=data/small/11 bs=1M count=256
dd if=/dev/urandom of=data/small/12 bs=1M count=256
dd if=/dev/urandom of=data/small/13 bs=1M count=256
dd if=/dev/urandom of=data/small/14 bs=1M count=256
dd if=/dev/urandom of=data/small/15 bs=1M count=256
dd if=/dev/urandom of=data/small/16 bs=1M count=256
dd if=/dev/urandom of=data/small/17 bs=1M count=256
dd if=/dev/urandom of=data/small/18 bs=1M count=256
dd if=/dev/urandom of=data/small/19 bs=1M count=256


dd if=/dev/urandom of=data/big/00 bs=1M count=2048
dd if=/dev/urandom of=data/big/01 bs=1M count=2048
