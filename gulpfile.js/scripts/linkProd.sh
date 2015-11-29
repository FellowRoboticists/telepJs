#!/bin/bash
TELEP=$(pwd)

for f in css fonts js 
do
  cp -fr "${TELEP}/prod/${f}" "${TELEP}/public"
done

cp "${TELEP}/prod/index.html" "${TELEP}/views/index.ejs"
