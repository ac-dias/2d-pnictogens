#!/bin/bash
#PBS -N  Sb-tb_bse
#PBS -e  job.err
#PBS -o  job.o
#PBS -q  workq 
#PBS -l  nodes=salpeter-06:ppn=16


module load wtb-dev-intel

ulimit -s unlimited




export OMP_NUM_THREADS=$NCPUS
export I_MPI_FABRICS=shm
#export I_MPI_HYDRA_TOPOLIB=ipl

cd $PBS_O_WORKDIR

wtb.x < input.dat





