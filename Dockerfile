FROM ubuntu:18.04

# 設置環境變數避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新包列表並安裝基礎工具
RUN apt-get update && apt-get install -y \
    apt-utils \
    curl \
    wget \
    vim \
    git \
    sudo \
    locales \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# 設置時區 (可根據需要更改)
ENV TZ=Asia/Taipei
RUN echo $TZ > /etc/timezone && \
    ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# 設置 UTF-8 本地化支持
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# 創建一個用戶 (可選)
RUN useradd -ms /bin/bash dockeruser && \
    echo "dockeruser:dockeruser" | chpasswd && \
    adduser dockeruser sudo

# 切換到非 root 用戶 (可選)
USER dockeruser
WORKDIR /home/dockeruser

# 默認命令
CMD ["bash"]
