#!/bin/bash
cd /kb_ctrl
source devel/setup.bash
echo "q/r     turn   left/right"
echo "w/s     move   forward/backward"
echo "a/d     move   left/right"
echo "space/f move   up/down"
echo "esc     quit"
roslaunch kb_ctrl kb_ctrl.launch