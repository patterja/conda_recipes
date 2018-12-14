#!/bin/bash

mkdir -p $PREFIX/bin
cp $RECIPE_DIR/epic.R $PREFIX/bin
$R CMD INSTALL .
