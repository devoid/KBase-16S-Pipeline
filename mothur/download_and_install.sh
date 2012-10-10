#!/bin/bash
# Download the mothur source from it's website
TARGET=$1
curl -O http://www.mothur.org/w/images/c/cb/Mothur.1.27.0.zip
unzip Mothur.1.27.0.zip
cd Mothur.source
make
cp mothur $TARGET/bin
cp uchime $TARGET/bin
