#!/bin/bash

# PGM -> PBM

[[ -n $3 ]] || {
    echo Usage: $0 '<black threshold> <input PGM image> <output PBM file name>'
    echo 'man unpaper for fine-tuning.'
    exit 0;
}

unpaper -b $1 --no-mask-scan --no-mask-center --no-deskew --no-wipe --no-border --no-border-scan --no-border-align --overwrite -t pbm $2 $3
