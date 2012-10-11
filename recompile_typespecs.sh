#!/bin/sh
name=Tornado
base=Bio::KBase::$name
spec=${name}.spec
# Remove \CR endings if they are present
if [ `command -v dos2unix 2>/dev/null` ]; then
    dos2unix ${spec}
fi
# Compile Tornado
compile_typespec               \
    -impl ${base}::Impl        \
    -service ${base}::Server   \
    -psgi ${name}.psgi         \
    -client ${base}            \
    -js ${name}                \
    -py ${name}                \
    ${spec} lib
