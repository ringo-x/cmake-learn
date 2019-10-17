#!/bin/bash
arg=$1
dir=./build

if [ -z ${arg} ]
then
    mkdir -p ${dir} 2>/dev/null
    cd ${dir}
    cmake ..
elif [ ${arg} == "run" ]
then
    cd ${dir}
    make && ./bin/helloworld
elif [ ${arg} == "rm" ]
then
    rm -rf ${dir}
else
    exit 1
fi

