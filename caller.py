from transformers import AutoTokenizer
from vllm import LLM, SamplingParams

import requests
import json
import time

class RequestCaller:
    def __init__(self, base_url):
        self.base_url = base_url

    def call(self, model, messages, max_repeats=3, sleep_time=2):
        url = f"{self.base_url}/v1/chat/completions"
        headers = {"Content-Type": "application/json"}
        data = {
            "model": model,
            "messages": messages
        }
        
        for attempt in range(1, max_repeats+1):
            try:
                response = requests.post(url, headers=headers, json=data)
                
                # 检查HTTP响应状态码是否表示成功
                if response.status_code == 200:
                    return response.json()
                else:
                    # 打印错误信息
                    print(f"Attempt {attempt}: Request failed with status code {response.status_code}")

            except requests.RequestException as e:
                # 打印异常信息，例如连接错误
                print(f"Attempt {attempt}: Request failed with exception {e}")
            
            # 除了最后一次尝试外，等待一段时间后再重试
            if attempt < max_repeats:
                print(f"Waiting for {sleep_time} seconds before next attempt...")
                time.sleep(sleep_time)
        
        # 如果所有尝试都失败，返回None或者抛出异常
        print("All attempts failed.")
        return None


class VLLMCaller:
    def __init__(self, model_name_or_path, dtype):
        self.tokenizer = AutoTokenizer.from_pretrained(model_name_or_path)

        # Pass the default decoding hyperparameters of Qwen2-7B-Instruct
        # max_tokens is for the maximum length for generation.
        self.sampling_params = SamplingParams(temperature=0.7, top_p=0.8, repetition_penalty=1.05, max_tokens=512)

        # Input the model name or path. Can be GPTQ or AWQ models.
        self.model = LLM(model=model_name_or_path, dtype=dtype)

    def call(self, prompts):
        messages = [[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": prompt}
        ] for prompt in prompts]

        texts = [self.tokenizer.apply_chat_template(
            msg,
            tokenize=False,
            add_generation_prompt=True
        ) for msg in messages]

        # generate outputs
        outputs = self.model.generate(texts, self.sampling_params)
        outputs = [out.outputs[0].text for out in outputs]
        return outputs


# 使用示例
if __name__ == "__main__":
    # caller = Caller("http://localhost:8000")
    # model = "Qwen2-7B-Instruct"
    # messages = [
    #     {"role": "system", "content": "You are a helpful assistant."},
    #     {"role": "user", "content": "Your Long Input Here."}
    # ]
    # response = caller.call_endpoint(model, messages, max_repeats=100)
    # if response is not None:
    #     print(json.dumps(response, indent=2))
    # else:
    #     print("Failed to get a successful response.")
    #

    caller = VLLMCaller("/data/home/scv6a42/archive/model/Qwen2-7B-Instruct", dtype='half')
    prompts = ["Tell me something about large language models." for i in range(3)]
    outputs = caller.call(prompts)
    print(outputs)

