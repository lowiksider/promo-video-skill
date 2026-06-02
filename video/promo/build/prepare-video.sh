#!/usr/bin/env bash
# Ré-encode l'enregistrement d'écran de l'app en keyframes denses (seek fiable
# au rendu HyperFrames). Dépose d'abord ta vidéo en assets/demo_raw.mp4.
#
#   bash build/prepare-video.sh
set -e
cd "$(dirname "$0")/.."
ffmpeg -y -loglevel error -i assets/demo_raw.mp4 \
  -c:v libx264 -r 30 -g 30 -keyint_min 30 -pix_fmt yuv420p -movflags +faststart -an \
  assets/demo_dense.mp4
echo "OK → assets/demo_dense.mp4"
