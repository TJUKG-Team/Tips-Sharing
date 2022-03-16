# 指定重新打包的镜像
FROM pytorch/pytorch:1.8.1-cuda10.2-cudnn7-runtime
# FROM tensorflow/tensorflow:2.7.0-gpu
# FROM tensorflow/tensorflow:0.12.1-gpu
# FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-runtime

# 安装sudo、zsh、git、tzdata(时区信息)
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt install -y sudo zsh git tzdata \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/

# 设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' > /etc/timezone

# 添加user
RUN adduser --disabled-password --shell /bin/zsh --uid 1000 --gecos '' user \
    && adduser user sudo \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# 配置新容器的默认设置
USER user
WORKDIR /home/user
CMD ["zsh"]

# 配置oh-my-zsh
COPY assets/.zshrc /home/user
ADD assets/.oh-my-zsh.tar /home/user

LABEL Author="MinghuiZou"
