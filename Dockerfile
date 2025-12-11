# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy-node-install comfyui-kjnodes

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/vae/flux2-vae.safetensors --relative-path models/vae --filename flux2-vae.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/text_encoders/mistral_3_small_flux2_fp8.safetensors --relative-path models/clip --filename mistral_3_small_flux2_fp8.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/diffusion_models/flux2_dev_fp8mixed.safetensors --relative-path models/diffusion_models --filename flux2_dev_fp8mixed.safetensors