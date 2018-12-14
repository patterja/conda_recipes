#!/bin/bash

# Conda package build script

mkdir -p $PREFIX/bin
cp galaxy_tools/tcrSeq/qc/galaxy.qc.R $PREFIX/bin
