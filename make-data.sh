#!/bin/bash

# Generate a bunch of random test data

mkdir -p data/4098
echo "Generating 1x4098MB"
dd if=/dev/urandom of=data/4098/00 bs=1M count=4098

source_file=data/4098/00

echo "Generating 32x128MB"
data_size=128
mkdir -p data/${data_size}
dd if=${source_file} of=data/${data_size}/00 bs=${data_size}M count=1
dd if=${source_file} of=data/${data_size}/01 bs=${data_size}M count=1 skip=01
dd if=${source_file} of=data/${data_size}/02 bs=${data_size}M count=1 skip=02
dd if=${source_file} of=data/${data_size}/03 bs=${data_size}M count=1 skip=03
dd if=${source_file} of=data/${data_size}/04 bs=${data_size}M count=1 skip=04
dd if=${source_file} of=data/${data_size}/05 bs=${data_size}M count=1 skip=05
dd if=${source_file} of=data/${data_size}/06 bs=${data_size}M count=1 skip=06
dd if=${source_file} of=data/${data_size}/07 bs=${data_size}M count=1 skip=07
dd if=${source_file} of=data/${data_size}/08 bs=${data_size}M count=1 skip=08
dd if=${source_file} of=data/${data_size}/09 bs=${data_size}M count=1 skip=09
dd if=${source_file} of=data/${data_size}/10 bs=${data_size}M count=1 skip=10
dd if=${source_file} of=data/${data_size}/11 bs=${data_size}M count=1 skip=11
dd if=${source_file} of=data/${data_size}/12 bs=${data_size}M count=1 skip=12
dd if=${source_file} of=data/${data_size}/13 bs=${data_size}M count=1 skip=13
dd if=${source_file} of=data/${data_size}/14 bs=${data_size}M count=1 skip=14
dd if=${source_file} of=data/${data_size}/15 bs=${data_size}M count=1 skip=15
dd if=${source_file} of=data/${data_size}/16 bs=${data_size}M count=1 skip=16
dd if=${source_file} of=data/${data_size}/17 bs=${data_size}M count=1 skip=17
dd if=${source_file} of=data/${data_size}/18 bs=${data_size}M count=1 skip=18
dd if=${source_file} of=data/${data_size}/19 bs=${data_size}M count=1 skip=19
dd if=${source_file} of=data/${data_size}/20 bs=${data_size}M count=1 skip=20
dd if=${source_file} of=data/${data_size}/21 bs=${data_size}M count=1 skip=21
dd if=${source_file} of=data/${data_size}/22 bs=${data_size}M count=1 skip=22
dd if=${source_file} of=data/${data_size}/23 bs=${data_size}M count=1 skip=23
dd if=${source_file} of=data/${data_size}/24 bs=${data_size}M count=1 skip=24
dd if=${source_file} of=data/${data_size}/25 bs=${data_size}M count=1 skip=25
dd if=${source_file} of=data/${data_size}/26 bs=${data_size}M count=1 skip=26
dd if=${source_file} of=data/${data_size}/27 bs=${data_size}M count=1 skip=27
dd if=${source_file} of=data/${data_size}/28 bs=${data_size}M count=1 skip=28
dd if=${source_file} of=data/${data_size}/29 bs=${data_size}M count=1 skip=29
dd if=${source_file} of=data/${data_size}/30 bs=${data_size}M count=1 skip=30
dd if=${source_file} of=data/${data_size}/31 bs=${data_size}M count=1 skip=31


echo "Generating 16x256MB"
data_size=256
mkdir -p data/${data_size}
dd if=${source_file} of=data/${data_size}/00 bs=${data_size}M count=1
dd if=${source_file} of=data/${data_size}/01 bs=${data_size}M count=1 skip=01
dd if=${source_file} of=data/${data_size}/02 bs=${data_size}M count=1 skip=02
dd if=${source_file} of=data/${data_size}/03 bs=${data_size}M count=1 skip=03
dd if=${source_file} of=data/${data_size}/04 bs=${data_size}M count=1 skip=04
dd if=${source_file} of=data/${data_size}/05 bs=${data_size}M count=1 skip=05
dd if=${source_file} of=data/${data_size}/06 bs=${data_size}M count=1 skip=06
dd if=${source_file} of=data/${data_size}/07 bs=${data_size}M count=1 skip=07
dd if=${source_file} of=data/${data_size}/08 bs=${data_size}M count=1 skip=08
dd if=${source_file} of=data/${data_size}/09 bs=${data_size}M count=1 skip=09
dd if=${source_file} of=data/${data_size}/10 bs=${data_size}M count=1 skip=10
dd if=${source_file} of=data/${data_size}/11 bs=${data_size}M count=1 skip=11
dd if=${source_file} of=data/${data_size}/12 bs=${data_size}M count=1 skip=12
dd if=${source_file} of=data/${data_size}/13 bs=${data_size}M count=1 skip=13
dd if=${source_file} of=data/${data_size}/14 bs=${data_size}M count=1 skip=14
dd if=${source_file} of=data/${data_size}/15 bs=${data_size}M count=1 skip=15

echo "Generating 8x512MB"
data_size=512
mkdir -p data/${data_size}
dd if=${source_file} of=data/${data_size}/00 bs=${data_size}M count=1
dd if=${source_file} of=data/${data_size}/01 bs=${data_size}M count=1 skip=01
dd if=${source_file} of=data/${data_size}/02 bs=${data_size}M count=1 skip=02
dd if=${source_file} of=data/${data_size}/03 bs=${data_size}M count=1 skip=03
dd if=${source_file} of=data/${data_size}/04 bs=${data_size}M count=1 skip=04
dd if=${source_file} of=data/${data_size}/05 bs=${data_size}M count=1 skip=05
dd if=${source_file} of=data/${data_size}/06 bs=${data_size}M count=1 skip=06
dd if=${source_file} of=data/${data_size}/07 bs=${data_size}M count=1 skip=07
dd if=${source_file} of=data/${data_size}/08 bs=${data_size}M count=1 skip=08

echo "Generating 4x1024MB"
data_size=1024
mkdir -p data/${data_size}
dd if=${source_file} of=data/${data_size}/00 bs=${data_size}M count=1
dd if=${source_file} of=data/${data_size}/01 bs=${data_size}M count=1 skip=01
dd if=${source_file} of=data/${data_size}/02 bs=${data_size}M count=1 skip=02
dd if=${source_file} of=data/${data_size}/03 bs=${data_size}M count=1 skip=03


echo "Generating 2x2048MB"
data_size=2048
mkdir -p data/${data_size}
dd if=${source_file} of=data/${data_size}/00 bs=${data_size}M count=1
dd if=${source_file} of=data/${data_size}/01 bs=${data_size}M count=1 skip=01

