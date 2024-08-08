export HF_ENDPOINT=https://hf-mirror.com

prefix=/data0/lyw/tzw/models/

# huggingface-cli download \
#     --resume-download \
#     Qwen/Qwen2-57B-A14B-Instruct-GPTQ-Int4 \
#     --token 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 \
#     --local-dir /data/home/scv6a42/archive/models/Qwen2-57B-A14B-Instruct-GPTQ-Int4


# huggingface-cli download \
#     --resume-download \
#     Qwen/Qwen2-7B-Instruct-GPTQ-Int4 \
#     --token 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 \
#     --local-dir /data/home/scv6a42/archive/models/Qwen2-7B-Instruct-GPTQ-Int4

 # huggingface-cli download \
 #     --resume-download \
 #     Qwen/Qwen2-7B-Instruct \
 #     --token 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 \
 #     --local-dir ${prefix}Qwen2-7B-Instruct



# huggingface-cli download \
#     --resume-download \
#     unsloth/llama-3-8b-Instruct \
#     --token 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 \
#     --local-dir /data/home/scv6a42/archive/models/llama-3-8b-Instruct


# huggingface-cli download \
#     --resume-download \
#     NousResearch/Meta-Llama-3-70B-Instruct \
#     --token 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 \
#     --local-dir ${prefix}llama-3-70b-Instruct

# huggingface-cli download \
#     --resume-download \
#     NousResearch/Meta-Llama-3-70B-Instruct-GGUF \
#     --token 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 \
#     --local-dir /data/home/scv6a42/archive/models/llama-3-70b-Instruct-GGUF

# huggingface-cli download \
#     --resume-download \
#     Qwen/Qwen2-72B-Instruct \
#     --token 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 \
#     --local-dir ${prefix}Qwen2-72B-Instruct

# huggingface-cli download \
#     --resume-download \
#     Qwen/Qwen2-72B-Instruct-GPTQ-Int4 \
#     --token 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 \
#     --local-dir ${prefix}Qwen2-72B-Instruct-GPTQ-Int4

huggingface-cli download \
    --resume-download \
    lmsys/vicuna-7b-v1.3 \
    --token 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 \
    --local-dir ${prefix}vicuna-7b-v1.3
