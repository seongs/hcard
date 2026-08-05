#!/bin/bash
# /opt/vllm/start_embed.sh
export VLLM_USE_FLASHINFER_SAMPLER=0
export HF_HUB_OFFLINE=1
export TRANSFORMERS_OFFLINE=1
export VLLM_NO_USAGE_STATS=1
export DO_NOT_TRACK=1

exec /root/vllm-test/bin/vllm serve /data/ksy_2/model/hf/BAAI/bge-m3/artifacts \
  --served-model-name bge-m3 \
  --runner pooling \
  --pooler-config '{"task":"embed"}' \
  --host 0.0.0.0 --port 8001 \
  --max-model-len 8192 \
  --gpu-memory-utilization 0.06
