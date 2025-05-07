#!/usr/bin/env bash
set -euo pipefail
#make it executable (chmod +x testnn.sh)
# Name of the executable produced by your Makefile
EXEC=neuralnet

for i in {0..9}; do
  echo "=== Iteration $i ==="

  echo "-- Building --"
  make

  echo "-- Running on ${i}.bmp --"
  # Link the current bmp into the name your code expects
  ln -sf "${i}.bmp" first_image_mnist.bmp
  ./"$EXEC"

  echo "-- Cleaning --"
  make clean

  echo
done

echo "All done!"
