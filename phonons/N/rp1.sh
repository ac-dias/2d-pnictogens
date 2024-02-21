#!/usr/bin/env bash

phonopy -d input.conf

mkdir sposcar

cp SPOSCAR ./sposcar/POSCAR
cp INCAR   ./sposcar/INCAR
cp KPOINTS ./sposcar/KPOINTS
cp POTCAR  ./sposcar/POTCAR

cp run.sh ./sposcar/run.sh



