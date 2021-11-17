#!/bin/sh

echo "=== run_docker ==="

IMAGE_NAME=ros_whill
dirname=$(pwd | xargs dirname)
docker run -it --rm \
    --mount type=bind,source=$dirname,target=/root/catkin_ws/src/$IMAGE_NAME \
    --net host \
    $IMAGE_NAME \
    bash -c "cd catkin_ws && catkin_make && cd .. && bash"
