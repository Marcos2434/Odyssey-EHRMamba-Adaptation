## EHRMamba - Pretrain
```
#!/bin/bash
#SBATCH --job-name=mamba_pretrain
#SBATCH --gres=gpu:4
#SBATCH --qos a100_amritk
#SBATCH -p a100
#SBATCH -c 24
#SBATCH --time=23:00:00
#SBATCH --mem=200G
#SBATCH --output=/h/afallah/odyssey/mamba_pretrain_a100-%j.out
#SBATCH --error=/h/afallah/odyssey/mamba_pretrain_a100-%j.err
#SBATCH --no-requeue

source /h/afallah/light/bin/activate

cd /h/afallah/odyssey/odyssey

export CUBLAS_WORKSPACE_CONFIG=:4096:2
export NCCL_DEBUG=INFO
export PYTHONFAULTHANDLER=1

stdbuf -oL -eL srun python3 pretrain.py  \
                --model-type ehr_mamba \
                --is-decoder True \
                --exp-name mamba_pretrain_with_embeddings \
                --config-dir odyssey/models/configs \
                --data-dir odyssey/data/bigbird_data \
                --sequence-file patient_sequences/patient_sequences_2048.parquet \
                --id-file patient_id_dict/dataset_2048_multi_v2.pkl \
                --vocab-dir odyssey/data/vocab \
                --val-size 0.1 \
                --checkpoint-dir checkpoints
```
