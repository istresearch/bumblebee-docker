#!/bin/bash

sudo apt-get install -y git python-virtualenv python-dev libre2-dev build-essential default-jdk

if [ ! -d "repos" ]; then
    mkdir repos
fi
cd repos
REPOS=('phantom-snap' 'sparkplugs' 'bumblebee' 'pyjnius')
for rr in "${REPOS[@]}" ; do
    if [ ! -d "$rr" ]; then
        git clone "git@github.com:istresearch/${rr}.git"
    fi 
done

if [ ! -d "/tmp/venv" ]; then
    virtualenv /tmp/venv
fi
source /tmp/venv/bin/activate

pip install flask cython gunicorn

cd pyjnius
git pull
pip install .
cd ..

cd phantom-snap 
git pull
pip install .
cd ..

cd sparkplugs
git checkout cdrtools
git pull
cd cdrtools
pip install .
cd ../..

cd bumblebee
git pull
pip install .
cd ..

if [ -d "venv" ]; then
    rm -rf venv
fi
cp -pr /tmp/venv .

