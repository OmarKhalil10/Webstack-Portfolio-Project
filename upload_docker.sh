#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub
# Assumes that an image is built via `run_docker.sh`

# Set version tag
MY_PROJECT_ID="ml-tf-398511"
IMAGE_NAME="camil"
VERSION="v1"

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
DOCKERPATH="omarkhalil10/gcr.io/$MY_PROJECT_ID/$IMAGE_NAME:$VERSION"

# Step 2:
# Authenticate & tag
docker login
docker tag camil:$VERSION $DOCKERPATH
echo "Docker ID and Image: $DOCKERPATH"

# Step 3:
# Push image to a docker repository
docker push $DOCKERPATH