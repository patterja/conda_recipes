#!/bin/bash

# Conda package build script

mkdir -p $PREFIX/bin
cp galaxy_tools/tcrSeq/normalize/normalize.clonotype.counts.R $PREFIX/bin

