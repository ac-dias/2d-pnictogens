#!/usr/bin/env bash


#phonopy -f disp-{001..002}/vasprun.xml

phonopy --fc sposcar/vasprun.xml

phonopy --readfc  -p bandas.conf -s 

phonopy-bandplot band.yaml --gnuplot >> disp.dat

phonopy --readfc anime.conf

phonopy --readfc  -p thermal.conf -s

phonopy-propplot thermal_properties.yaml --gnuplot >> thermal.dat

