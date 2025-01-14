#!/bin/bash
set -exu

bindgen \
  --whitelist-type="^CU.*" \
  --whitelist-type="^cuuint(32|64)_t" \
  --whitelist-type="^cudaError_enum" \
  --whitelist-type="^cu.*Complex$" \
  --whitelist-type="^cuda.*" \
  --whitelist-type="^libraryPropertyType.*" \
  --whitelist-var="^CU.*" \
  --whitelist-function="^cu.*" \
  --default-enum-style=rust \
  --no-doc-comments \
  --with-derive-default \
  --with-derive-eq \
  --with-derive-hash \
  --with-derive-ord \
  wrapper.h -- -I/usr/local/cuda-11.7/include \
  > src/cuda.rs
