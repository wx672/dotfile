#!/bin/bash
_mupdf() {
  _init_completion 2>/dev/null || true

  local EXTS="pdf|xps|epub|xhtml|cbz|png|jpg|jpeg|gif|tiff|tif"

  _filedir "${EXTS#|}" 2>/dev/null || COMPREPLY=($(shopt -s extglob; compgen -f -X "!*.@($EXTS)"))
}
complete -F _mupdf mupdf
complete -F _mupdf mupdf-gl
