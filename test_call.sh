#!/bin/bash
module load cuda/11.0
module load anaconda/2020.11
source activate LLM_server

nohup ./launch/Qwen2-7B-Instruct.sh &
# python caller.py
curl http://localhost:8000/v1/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "Qwen2-7B-Instruct",
        "prompt": "你好",
        "max_tokens": 50,
        "temperature": 0
    }'
