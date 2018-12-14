#!/bin/bash

# Conda package build script

mkdir -p $PREFIX/bin

cp galaxy_tools/tcrAnalysis/diversityAnalysis/analysis.R $PREFIX/bin
cp galaxy_tools/tcrAnalysis/diversityAnalysis/multiBatchDiversityAnalysis.R $PREFIX/bin
