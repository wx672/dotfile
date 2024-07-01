#!/bin/bash

cmdchk mihomo || exit 127

CFG_DIR="$XDG_CONFIG_HOME/mihomo"
FY="$CFG_DIR/fy-55549.yaml"
FREE="$CFG_DIR/config.yaml"
ERR="INT TERM EXIT"

clash() { mihomo -f "${1:-$FREE}"; }

[[ "$1" ]] && { # whatever $1 is
  clash $FY
  trap "clash $FY" $ERR
} || {
  clash
  trap "clash" $ERR
}
