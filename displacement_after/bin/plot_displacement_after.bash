#!/bin/bash

# 出力をepsファイルにする
GMT gmtset PAPER_MEDIA a4+
# 紙の縦置きをデフォルトにする（-Pが不要になる）
GMT gmtset PAGE_ORIENTATION portrait
# 単位をcmにする
GMT gmtset MEASURE_UNIT cm

OUTPUT_DIR=outputs/displacement_after

RANGE=$(cat ${OUTPUT_DIR}/box.dat | ruby -e "puts gets.split.join('/')")
BIN_WIDTH=$(cat ${OUTPUT_DIR}/binned_heights/width.dat | ruby -e "print gets.strip")u
# 棒グラフ
# -Jx0.5cは、rcが半径であるのに対してGMTの3カラム目は直径であることから、単位の変換などしなくてもちょうど良い具合に表示されるという性質を利用している。
GMT psxy \
    ${OUTPUT_DIR}/binned_heights/x_y.dat \
    -R${RANGE} \
    -Jx0.5c \
    -Ba20f10 \
    -Sb${BIN_WIDTH} \
    -W50,255/0/0 \
    -K
# 要素
GMT psxy \
    ${OUTPUT_DIR}/circular_elements.dat \
    -J \
    -R \
    -B \
    -Sc \
    -O
