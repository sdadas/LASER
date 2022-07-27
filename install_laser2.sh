#!/bin/bash
# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.
#
# LASER  Language-Agnostic SEntence Representations
# is a toolkit to calculate multilingual sentence embeddings
# and to use them for document classification, bitext filtering
# and mining
# 
#-------------------------------------------------------
#
# This bash script installs sentence encoders from Amazon s3
#

if [ -z ${LASER} ] ; then 
  echo "Please set the environment variable 'LASER'"
  exit
fi

mdir="${LASER}/models"

# available encoders
s3="https://dl.fbaipublicfiles.com/nllb/laser"
networks=("laser2.pt" "laser2.spm" "laser2.cvocab")


echo "Downloading networks"

if [ ! -d ${mdir} ] ; then
  echo " - creating directory ${mdir}"
  mkdir -p ${mdir}
fi

cd ${mdir}
for f in ${networks[@]} ; do
  if [ -f ${f} ] ; then
    echo " - ${mdir}/${f} already downloaded"
  else
    echo " - ${f}"
    wget -q ${s3}/${f}
  fi
done
