#!/bin/sh
# Remove \CR endings if they are present
if [ `command -v dos2unix 2>/dev/null` ]; then
    dos2unix Tornado.spec 
fi
# Compile Tornado
base=Bio::KBase::Tornado
compile_typespec               \
    -impl ${base}::Impl        \
    -service ${base}::Server   \
    -psgi ${base}.psgi         \
    -client ${base}            \
    -js ${base}                \
    -py ${base}                \
    Tornado.spec lib
