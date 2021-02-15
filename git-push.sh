#!/bin/bash

#cd build-u1604
cd smu-build
make clean
cd ..
git add .
git commit -m "master"
git push
