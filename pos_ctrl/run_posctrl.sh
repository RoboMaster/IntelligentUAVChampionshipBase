xhost +local:docker
docker run -it --net host  -v /tmp/.X11-unix:/tmp/.X11-unix:rw -e DISPLAY=$DISPLAY --name pos_ctrl --rm  pos_ctrl