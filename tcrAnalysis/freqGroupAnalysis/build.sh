#!/bin/bash

# Conda package build script

mkdir -p $PREFIX/bin

cp galaxy_tools/tcrAnalysis/frequencyGroupAnalysis/groupClonesByFreq.R $PREFIX/bin
cp galaxy_tools/tcrAnalysis/frequencyGroupAnalysis/homeostasisAnalysis.R $PREFIX/bin
cp galaxy_tools/tcrAnalysis/frequencyGroupAnalysis/multiBatchHomeostasisAnalysis.R $PREFIX/bin
