# 指定重新打包的镜像
FROM pytorch/pytorch:1.8.1-cuda10.2-cudnn7-runtime
# FROM tensorflow/tensorflow:2.7.0-gpu
# FROM tensorflow/tensorflow:0.12.1-gpu

# 设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' > /etc/timezone

# 安装sudo、zsh
RUN apt update \
    && apt install -y sudo zsh \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/

# 添加user
RUN adduser --disabled-password --shell /bin/zsh --uid 1000 --gecos '' user \
    && adduser user sudo \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# 配置oh-my-zsh
COPY assets/.zshrc /home/user
ADD assets/.oh-my-zsh.tar /home/user
RUN chsh -s /bin/zsh \
    && echo 'export PATH=/home/user/.local/bin:$PATH' >> /home/user/.zshrc

# 配置新容器的默认设置
USER user
WORKDIR /home/user
CMD ["zsh"]

LABEL Author="MinghuiZou" Description="ADD['sudo', 'account:user', 'zsh']"