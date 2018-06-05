# Conda package build script

export SAMTOOLS_ROOT=${PREFIX}/include/bam
echo $SAMTOOLS_ROOT
make
mkdir -p $PREFIX/bin
cp msisensor $PREFIX/bin
