FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
RUN apt-get update \
    && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    unzip \
    yasm \
    pkg-config \
    libswscale-dev \
    libtbb2 \
    libtbb-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libavformat-dev \
    libpq-dev \
    libsm6 libxrender1 libfontconfig1 \
    ffmpeg \
    htop \
    libopenblas-dev \
    libomp-dev \
    tmux \
    python3-pip
COPY . /py-bottom-up-attention
RUN cd py-bottom-up-attention \
    && pip3 install --upgrade pip \
    && pip3 install scikit-build \
    && pip3 install -r requirements.txt \
    && python3 setup.py build develop
WORKDIR /py-bottom-up-attetion