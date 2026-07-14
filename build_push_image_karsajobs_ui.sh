#!/bin/bash

# Mendefinisikan variabel untuk nama image frontend di GitHub Container Registry
IMAGE_NAME="ghcr.io/zallengrad/karsajobs-ui:latest"

# 1. Build Docker image dari berkas Dockerfile yang disediakan
echo "Membangun Docker image untuk Frontend Karsa Jobs..."
docker build -t $IMAGE_NAME .

# 2. Login ke GitHub Packages (GHCR)
echo "Login ke GitHub Container Registry..."
echo $CR_PAT | docker login ghcr.io -u zallengrad --password-stdin

# 3. Push image ke GitHub Packages
echo "Mengunggah image frontend ke GHCR..."
docker push $IMAGE_NAME
