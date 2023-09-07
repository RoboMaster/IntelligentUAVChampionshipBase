xhost +local:docker
docker run -it --net host -e DISPLAY=$DISPLAY --name kb_ctrl --rm -v /tmp/.X11-unix:/tmp/.X11-unix:rw kb_ctrl