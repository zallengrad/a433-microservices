#!/bin/bash

# Mendefinisikan variabel untuk nama image backend dan tag latest di GitHub Container Registry
IMAGE_NAME="ghcr.io/zallengrad/karsajobs:latest"

# 1. Build Docker image dari berkas Dockerfile yang disediakan
echo "Membangun Docker image untuk Backend Karsa Jobs..."
docker build -t $IMAGE_NAME .

# 2. Login ke GitHub Packages (GHCR)
# Pastikan kamu sudah export token GitHub di terminal: export CR_PAT="token_kamu"
echo "Login ke GitHub Container Registry..."
echo $CR_PAT | docker login ghcr.io -u zallengrad --password-stdin

# 3. Push image ke GitHub Packages
echo "Mengunggah image backend ke GHCR..."
docker push $IMAGE_NAME
