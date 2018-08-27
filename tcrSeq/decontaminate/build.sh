#!/bin/bash

# Conda package build script

mkdir -p $PREFIX/bin
cp galaxy_tools/tcrSeq/decontaminate/decontaminate.clones.R $PREFIX/bin

