# Conda package build script

make

mkdir -p $PREFIX/bin
cp -r MLDBM $PREFIX/bin/
cp -r Parallel $PREFIX/bin/
cp -r Text $PREFIX/bin/
cp scalpel* $PREFIX/bin/
cp *.pl $PREFIX/bin/
cp *.pm $PREFIX/bin/
