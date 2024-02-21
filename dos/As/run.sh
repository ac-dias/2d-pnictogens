#!/bin/bash
#PBS -N  As-dos
#PBS -e  job.err
#PBS -o  job.o
#PBS -q  workq 
#PBS -l  nodes=01:ppn=16


module load vasp-6
module load vasp-pp

ulimit -s unlimited




export OMP_NUM_THREADS=1
export I_MPI_FABRICS=shm
#export I_MPI_HYDRA_TOPOLIB=ipl

cd $PBS_O_WORKDIR


mpirun -hostfile $PBS_NODEFILE -np $NCPUS vasp_std > log-scf.out





