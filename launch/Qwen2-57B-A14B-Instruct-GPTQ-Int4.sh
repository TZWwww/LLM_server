#!/bin/bash
module load cuda/11.0
module load anaconda/2020.11
source activate LLM_server

python -m vllm.entrypoints.openai.api_server --served-model-name Qwen2-57B-A14B-Instruct-GPTQ-Int4 --model /data/home/scv6a42/archive/model/Qwen2-57B-A14B-Instruct-GPTQ-Int4/
