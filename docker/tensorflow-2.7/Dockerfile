FROM tensorflow/tensorflow:2.7.0-gpu

LABEL Author="MinghuiZou" Description="ADD['sudo', 'account:user']"

RUN apt update \
    && apt install -y sudo \
    && apt autoremove --purge \
    && apt autoclean && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/
RUN adduser --disabled-password --shell /bin/bash --uid 1000 --gecos '' user \
    && adduser user sudo \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER user
WORKDIR /home/user
CMD ["bash"]