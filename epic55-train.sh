#!/bin/bash -login

#SBATCH --job-name=epic55-object-detection
#SBATCH --mail-user=hn19387
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --gres=gpu:2
#SBATCH --partition=gpu
#SBATCH --mem=40G
#SBATCH --time=3-00:00:00
#SBATCH --output=../results/epic55-object-detection_%j.out
#SBATCH --error=../results/epic55-object-detection_%j.err

module load CUDA
module load languages/anaconda3/3.7
module load tools/git/2.18.0
export LD_LIBRARY_PATH=/mnt/storage/software/languages/anaconda/Anaconda3-2019-3.7/lib:$LD_LIBRARY_PATH 

echo 'Runing on:' $HOSTNAME

cd ../u-yolov3

srun python train.py --cfg 'cfg/yolov3-epic55-obj.cfg' --data 'data/epic55/epic55.data' --epochs 150 --img-size 608 --batch-size 20 --weights '' --name 'epic55-object-detection'



