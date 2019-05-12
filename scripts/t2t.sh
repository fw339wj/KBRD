#!/bin/bash
let num_runs=32

for i in $(seq 0 $((num_runs-1)));
do
    CUDA_VISIBLE_DEVICES=$((i % 8)) python parlai/tasks/redial/train_transformer.py -mf saved/transformer_$i &
    if [ $(( (i+1) % 8 )) -eq 0 ]; then
        wait
    fi
done

