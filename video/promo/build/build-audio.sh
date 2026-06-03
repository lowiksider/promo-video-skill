#!/usr/bin/env bash
# Assemble la piste master = voix off (placée aux bons temps) + musique
# « Inspired Ambient » duckée sous la voix. → assets/master_audio.mp3
#
#   bash build/build-audio.sh
#
# Pré-requis : assets/vo/final/s{1,2,3,4,5,6,8}.mp3 (cf. generate-voiceover.mjs)
# Les délais (ms) correspondent aux data-start de index.html (durée totale 37.6s).
# ⚠️ Si tu régénères la voix (v3 non déterministe), re-mesure chaque segment
#    et réajuste ces adelay + les data-start de index.html.
set -e
cd "$(dirname "$0")/.."

MUSIC="../../skills/promo-video/music/inspired-ambient-141686.mp3"
TOTAL=37.6

ffmpeg -y -loglevel error \
 -i assets/vo/final/s1.mp3 -i assets/vo/final/s2.mp3 -i assets/vo/final/s3.mp3 \
 -i assets/vo/final/s4.mp3 -i assets/vo/final/s5.mp3 -i assets/vo/final/s6.mp3 \
 -i assets/vo/final/s8.mp3 \
 -filter_complex "\
 [0:a]adelay=600|600[a0];[1:a]adelay=5620|5620[a1];[2:a]adelay=8650|8650[a2];\
 [3:a]adelay=17050|17050[a3];[4:a]adelay=21240|21240[a4];[5:a]adelay=26050|26050[a5];\
 [6:a]adelay=32530|32530[a6];\
 [a0][a1][a2][a3][a4][a5][a6]amix=inputs=7:duration=longest:normalize=0,apad=whole_dur=${TOTAL}[vo]" \
 -map "[vo]" -t $TOTAL assets/vo/final/vo_mix.mp3

ffmpeg -y -loglevel error -stream_loop 2 -i "$MUSIC" -i assets/vo/final/vo_mix.mp3 -filter_complex "\
 [0:a]atrim=0:${TOTAL},afade=t=in:st=0:d=1.3,afade=t=out:st=35.9:d=1.7,volume=0.14[music];\
 [1:a]asplit=2[vo1][vosc];\
 [music][vosc]sidechaincompress=threshold=0.04:ratio=10:attack=12:release=300[ducked];\
 [vo1][ducked]amix=inputs=2:duration=longest:normalize=0,loudnorm=I=-15:TP=-1.5:LRA=11[out]" \
 -map "[out]" -t $TOTAL -ar 44100 assets/master_audio.mp3

echo "OK → assets/master_audio.mp3 ($(ffprobe -v error -show_entries format=duration -of csv=p=0 assets/master_audio.mp3)s)"
