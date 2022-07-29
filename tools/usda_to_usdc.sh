#!/bin/bash

# Convert .usda to .usdc
# ref: https://graphics.pixar.com/usd/release/tut_converting_between_layer_formats.html

USDCAT="/usr/bin/usdcat"
INFILE="./backdrop/geo/stand"

"${USDCAT}" -o "${INFILE}.usdc" "${INFILE}.usda"