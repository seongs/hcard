#!/bin/bash
# /opt/vllm/start.sh
export VLLM_USE_FLASHINFER_SAMPLER=0
export HF_HUB_OFFLINE=1
export TRANSFORMERS_OFFLINE=1
export VLLM_NO_USAGE_STATS=1
export DO_NOT_TRACK=1

exec /root/vllm-test/bin/vllm serve /data/ksy_2/model/hf/Qwen/Qwen3.6-27B/artifacts \
  --served-model-name Qwen3.6-27B \
  --host 0.0.0.0 --port 8000 \
  --enable-auto-tool-choice \
  --tool-call-parser qwen3_coder 
