#!/bin/bash -xe

basedir=$(dirname "$0")

mkdir -p "$basedir/gen/binaries" || true

wget -c -nv 'https://repoz.dextra.com.br/repoz/r/pub/jdk/oracle/jdk-8u91-linux-x64.tar.gz' -O "$basedir/gen/binaries/jdk-8u91-linux-x64.tar.gz" &

wait

echo Download
