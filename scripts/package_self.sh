#!/bin/bash

cd $(dirname $0)/../

./upack \
  -o upack-$(git describe --always).deb \
  -H Package:upack \
  -H Version:$(git describe --always) \
  -H "Maintainer: Jonas Weber <dev@jonasw.de>" \
  -H Architecture:any \
  -D dash \
  upack:/usr/bin/upack \
  upack.1:/usr/share/man/man1/upack.1
