FROM ubuntu:plucky

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    clang-20 \
    cmake \
    ffmpeg \ 
    git \
    libfftw3-dev \
    libjpeg-dev \
    libomp-dev \
    libopenmpi-dev \
    libpng-dev \
    ninja-build \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Link clang and clang++ to the version installed
RUN  ln -s /usr/bin/clang-20 /usr/bin/clang \
    && ln -s /usr/bin/clang++-20 /usr/bin/clang++

# Copy project files
COPY . /app

# Run the configure and build script
RUN chmod +x /app/configure-and-build.sh
ENTRYPOINT [ "/app/configure-and-build.sh" ]
