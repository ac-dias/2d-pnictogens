#!/bin/bash
#PBS -N  N-raman
#PBS -e  job.err
#PBS -o  job.o
#PBS -q  workq 
#PBS -l  nodes=salpeter-08:ppn=16


module load vasp-6
module load vasp-pp

ulimit -s unlimited




export OMP_NUM_THREADS=1
export I_MPI_FABRICS=shm
#export I_MPI_HYDRA_TOPOLIB=ipl

cd $PBS_O_WORKDIR

cd ./PHONON

mpirun -hostfile $PBS_NODEFILE -np $NCPUS vasp_std > log-scf.out

cd ..

cp ./PHONON/OUTCAR OUTCAR.phon

export VASP_RAMAN_RUN="mpirun -hostfile $PBS_NODEFILE -np $NCPUS vasp_std > log.out"
export VASP_RAMAN_PARAMS='01_3_2_0.01'

python2 /etc/programs/vasp-pp/bin/vasp_raman.py > vasp_raman.out







