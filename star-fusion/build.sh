#!/bin/bash

make

mkdir -p $PREFIX/bin

cp STAR-Fusion $PREFIX/bin
cp *.pl $PREFIX/bin
