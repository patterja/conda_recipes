# Conda package build script

export CPLUS_INCLUDE_PATH=${PREFIX}/bin/bamtools-2.3.0/include
export LIBRARY_PATH=${PREFIX}/bin/bamtools-2.3.0/bamtools-2.3.0/lib
export CXX="g++"
export CXXFLAGS="-Wno-deprecated -Wall -O3 -fexceptions -g -Wl,-rpath,${PREFIX}/bin/bamtools-2.3.0/lib/bamtools"
export INCLUDES="-I${PREFIX}bin/bamtools-2.3.0/include/bamtools -L${PREFIX}/bin/bamtools-2.3.0/lib/bamtools"

#install bamtools
rm -rf bamtools-2.3.0
wget https://github.com/pezmaster31/bamtools/archive/v2.3.0.tar.gz
tar -zxvf v2.3.0.tar.gz
mkdir -p bamtools-2.3.0/build
cd bamtools-2.3.0/build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX}/bin/bamtools-2.3.0 ..
make install
cd ../../

#install samtools
cd samtools-1.1/
make
cd ../

#install bcftools
cd bcftools-1.1/
make
cd ../

#install Microassembler
cd Microassembler
g++ -std=c++0x -Wno-deprecated -Wall -O3 -fexceptions -Wl,-rpath,${PREFIX}/bin/bamtools-2.3.0/lib/bamtools/ -I${PREFIX}/bin/bamtools-2.3.0/include/bamtools/ -L${PREFIX}/bin/bamtools-2.3.0/lib/bamtools/ Microassembler.cc Edge.cc Node.cc Graph.cc Path.cc ContigLink.cc align.cc util.cc -o Microassembler -lbamtools -lz
cd ../

#Move perl libs
cp *.pm $PREFIX/bin/
cp -r MLDBM $PREFIX/bin
cp -r Parallel $PREFIX/bin
cp -r Text $PREFIX/bin

mkdir -p $PREFIX/bin
cp scalpel* $PREFIX/bin/
cp *.pl $PREFIX/bin/

#rsync -rlv bamtools-2.3.0 $PREFIX/bin/
rsync -Rv samtools-1.1/samtools $PREFIX/bin/
rsync -Rv bcftools-1.1/bcftools $PREFIX/bin/
rsync -Rv Microassembler/Microassembler $PREFIX/bin/
