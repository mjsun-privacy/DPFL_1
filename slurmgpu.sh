#!/bin/bash -l

#SBATCH -J dspoddfl
#SBATCH --time=0-3:00:00
#SBATCH --array=0-5
#SBATCH -p gpu
#SBATCH --gres=gpu:rtx2080ti:1
#SBATCH -o outfiles/%A_%a.out

COMMAND='source /storage/homefs/ms23h901/git/DPFL_1/.venv/bin/activate'
echo $COMMAND

COMMAND="python main.py $SLURM_ARRAY_TASK_ID DPFL"
echo $COMMAND

$COMMAND

COMMAND='deactivate'
echo $COMMAND
$COMMAND