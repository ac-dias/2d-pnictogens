#!/bin/bash
#PBS -N  P-soc
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

cp INCAR-scf INCAR
cp KPOINTS-scf KPOINTS

mpirun -hostfile $PBS_NODEFILE -np $NCPUS vasp_ncl > log-scf.out

cp INCAR-bands INCAR
cp KPOINTS-bands KPOINTS

mpirun -hostfile $PBS_NODEFILE -np $NCPUS vasp_ncl > log-bands.out

vbands_k.x 6 > bandas.dat




