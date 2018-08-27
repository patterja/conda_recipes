#!/bin/bash

# Conda package build script

mkdir -p $PREFIX/bin
cp galaxy_tools/tcrSeq/calc.scaling.factor/calculate.scaling.factor.R $PREFIX/bin

