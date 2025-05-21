#!/bin/bash

# 1. Remove old elearning folder if exists
rm -rf dist/elearning

# 2. Create elearning folder
mkdir -p dist/elearning

# 3. Move all contents into dist/elearning
mv dist/assets dist/elearning/

echo "✅ Moved build files into dist/elearning/"
