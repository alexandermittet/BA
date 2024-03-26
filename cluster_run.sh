#!/bin/bash
# normal cpu stuff: allocate cpus, memory
#SBATCH --ntasks=1 --cpus-per-task=4 --mem=6000M
# we run on the gpu partition and we allocate 2 titanx gpus
#SBATCH -p gpu --gres=gpu:1
#We expect that our program should not run longer than 4 hours
#Note that a program will be killed once it exceeds this time!
#SBATCH --time=0:30:00

#your script, in this case: write the hostname and the ids of the chosen gpus.
hostname
echo $CUDA_VISIBLE_DEVICES

./mount_erda.sh
# Run baseline (No quantization)
python src/run_experiment.py -m project_name=workertest model.depth=5 model.width=512 device=cuda baseline=True quant.bit=32 repetitions=1 data.num_workers=2 quant.act_quant=False quant.weight_quant=False quant.bias_quant=False
./unmount_erda.sh