#!/bin/sh 
### General options 
### -- specify the queue -- 
#BSUB -q hpc                   # Name of the queue
### -- set the job Name -- 
#BSUB -J EHRMamba_results           # Job name
### -- ask for 4 cores -- 
#BSUB -n 4                     # Number of cores
### -- ensure the cores are on the same node -- 
#BSUB -R "span[hosts=1]"       # Run on a single host
### -- request 4GB of memory per core -- 
#BSUB -R "rusage[mem=10GB]"     # Memory per core
### -- set maximum memory to 5GB per core -- 
#BSUB -M 11GB                   # Kill job if it uses more than this
### -- set the walltime limit to 1 hour -- 
#BSUB -W 24:00                 # Time limit for the job
### -- set an email for notifications (optional) -- 
#BSUB -u s243302@dtu.dk
### -- send an email when the job starts and ends -- 
#BSUB -B 
#BSUB -N 
### -- specify output and error files -- 
#BSUB -o Output_%J.out         # Stdout will be written here
#BSUB -e Error_%J.err          # Stderr will be written here

### -- commands to run your application --
echo "Starting job at $(date)"
python cli.py --output_path=output-ehrmamba-lasttry7epochs/ --model_type=EHRMamba --epochs=7 --batch_size=256 --lr=0.001 --state_size=8 --heads=6 --layers=10  # Run your Python script with the argument
echo "Job finished at $(date)"
