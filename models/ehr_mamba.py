#ESTO NO ES EL MODELO NI NADA PARECIDO, ES UNA CHORRADA QUE HE HEHCO PARA PROBAR COSAS
import logging

import torch
import numpy as np
import matplotlib.pyplot as plt
import tqdm
from torch.utils.data import DataLoader
from torch import nn
from sklearn import metrics
import json
import pandas as pd
from mortality_part_preprocessing import PairedDataset, MortalityDataset
from models.regular_transformer import EncoderClassifierRegular
from models.early_stopper import EarlyStopping
from models.deep_set_attention import DeepSetAttentionModel
from models.grud import GRUDModel
from models.ip_nets import InterpolationPredictionModel
# added
# from models.EHRMamba import MambaPretrain
from odyssey.odyssey.models.ehr_mamba.model import MambaPretrain

train_collate_fn = PairedDataset.paired_collate_fn_truncate
val_test_collate_fn = MortalityDataset.non_pair_collate_fn_truncate
train_dataloader = DataLoader(train_pair, train_batch_size, shuffle=True, num_workers=16, collate_fn=train_collate_fn, pin_memory=True)


iterable_inner_dataloader = iter(train_dataloader)
test_batch = next(iterable_inner_dataloader)
max_seq_length = test_batch[0].shape[2]
sensor_count = test_batch[0].shape[1]
static_size = test_batch[2].shape[1]

model = MambaPretrain(
    vocab_size=sensor_count, # or/and other parameters that we might need
    **model_args
    )
print("hola")

predictions = model(
    #x=data, static=static, time=times, sensor_mask=mask, delta=delta
)
print(len(predictions))