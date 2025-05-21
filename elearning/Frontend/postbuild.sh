#!/bin/bash

set -e  # ❗ หากมี error ให้หยุดทันที

# 1. Remove old elearning folder if exists
rm -rf dist/elearning

# 2. Create dist/elearning folder
mkdir -p dist/elearning

# 3. Move required files into dist/elearning
# Move only if files exist
if [ -f dist/index.html ]; then
  mv dist/index.html dist/elearning/
fi

if [ -d dist/assets ]; then
  mv dist/assets dist/elearning/
fi

echo "✅ Moved build files into dist/elearning/"
