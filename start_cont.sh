
read -p "Enter Tag: " TAG_NAME
docker run --gpus 0 \
           --rm \
	   -itd \
           --network host \
           --name dpt \
           --env-file conf.sh \
           --shm-size 8G \
           -v $(pwd):/tf \
           intel/dpt:${TAG_NAME}
