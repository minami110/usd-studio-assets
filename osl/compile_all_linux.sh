#!/bin/bash

# set your oslc path
export "OSLC=${HOME}/.local/ktoa/ktoa-4.1.2.0-kat5.0-linux/bin/oslc"

# set osl directory and compiled oso directory (May do not touch)
export "IN_DIR=./osl"
export "OUT_DIR=./oso"

# set current directory
cd "$(dirname "$0")"

# if not exist $OUT_DIR, make it
mkdir -p "${OUT_DIR}"

# search all .osl files and compile to .osl
shopt -s globstar
for f in ${IN_DIR}/**/*.osl; do
    filename=$(basename -- "${f}")
    filename="${filename%.*}" # without ext
    "${OSLC}" -v -o "${OUT_DIR}/${filename}.oso" ${f}
done
