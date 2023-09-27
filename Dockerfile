FROM ubuntu:20.04

USER root
ADD basic_dev /basic_dev

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt update && apt install -y cmake build-essential libboost-all-dev

RUN cd basic_dev && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make 

ENTRYPOINT [ "/basic_dev/build/GNSSDECODERTEST" ]