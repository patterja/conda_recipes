#!/bin/bash
# Conda package build script

cd src
g++ -std=c++0x -Wno-deprecated -Wall -O3 -fexceptions -g -Wl,-rpath,${PREFIX}/lib -I${PREFIX}/include -I${PREFIX}/include/bamtools -L${PREFIX}/lib64 -L${PREFIX}/lib Lancet.cc Edge.cc Node.cc Graph.cc Microassembler.cc Ref.cc Path.cc ContigLink.cc align.cc util.cc sha256.cc VariantDB.cc Variant.cc -o lancet -llzma -lbz2 -lz -ldl -lpthread -lcurl -lcrypto -lbamtools ${PREFIX}/lib/libhts.a ${PREFIX}/lib/libdeflate.so

mkdir -p ${PREFIX}/bin
cp lancet ${PREFIX}/bin/
