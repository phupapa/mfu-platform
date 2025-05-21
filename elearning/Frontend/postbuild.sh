#!/bin/bash
set -e

rm -rf dist/elearning
mkdir -p dist/elearning

cp -r dist/assets dist/index.html dist/elearning/
echo "✅ Ready dist/elearning/ structure done"