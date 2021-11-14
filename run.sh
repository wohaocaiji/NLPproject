###
 # @Descripttion: 
 # @version: 
 # @Author: zhaojin
 # @Date: 2021-11-13 21:00:51
 # @LastEditTime: 2021-11-14 11:14:02
### 
#! /bin/bash
BERT_BASE_DIR=bert-base-chinese
DATA_DIR=data
OUTPUT_DIR=./model/clue_bilstm
# export CUDA_VISIBLE_DEVICES=0

python src/ner.py \
    --model_name_or_path ${BERT_BASE_DIR} \
    --do_train True \
    --do_eval True \
    --do_test False \
    --max_seq_length 256 \
    --train_file ${DATA_DIR}/train_ner.txt \
    --eval_file ${DATA_DIR}/dev_ner.txt \
    --test_file ${DATA_DIR}/test_ner.txt \
    --train_batch_size 16 \
    --eval_batch_size 32 \
    --num_train_epochs 10 \
    --do_lower_case \
    --logging_steps 200 \
    --need_birnn True \
    --rnn_dim 256 \
    --clean True \
    --output_dir $OUTPUT_DIR