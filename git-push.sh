#!/bin/bash

cd build-u1604
make clean
cd ..
git add .
git commit -m "master"
git push
