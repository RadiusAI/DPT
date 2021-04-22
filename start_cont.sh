#!/usr/bin/env bash
source conf.sh

if [[ -z $IMAGE_TAG ]]
then
  echo "No image tag provided. Not building image."
else
  docker build -t intel/dpt:$IMAGE_TAG .
fi

docker run --gpus 0 \
           --rm \
	   -itd \
           --network host \
           --name dpt \
           --env-file conf.sh \
           --shm-size 8G \
           -v $(pwd):/tf \
           intel/dpt:${IMAGE_TAG}
