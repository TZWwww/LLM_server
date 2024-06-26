#!/bin/bash
module load cuda/11.0
module load anaconda/2020.11
source activate LLM_server

python -m vllm.entrypoints.openai.api_server --served-model-name Qwen2-7B-Instruct --dtype=half --model /data/home/scv6a42/archive/model/Qwen2-7B-Instruct
