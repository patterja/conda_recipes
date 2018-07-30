#!/bin/bash

pip install --index-url https://test.pypi.org/simple/ dryad

mkdir -p $PREFIX/bin
cp * $PREFIX/bin
