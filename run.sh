#!/bin/bash
#SBATCH --time=10:00:00
#SBATCH --mem-per-cpu=4G
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=6
#SBATCH --output=logs/%A.out
#SBATCH --job-name=ser
#SBATCH -n 1

module load miniconda
# module load cuda/11.8 

source activate  pytorch-env 

# speech emotion recognition
cd ./recipes/IEMOCAP/emotion_recognition
python train.py hparams/train.yaml
# crnn 30134663

# python train_with_wav2vec2.py hparams/train_with_wav2vec2.yaml
# w2v2 30134285


