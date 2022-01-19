FROM texlive/texlive:latest

LABEL Author="MinghuiZou" Description="ADD['sudo', 'account:user', 'winfonts']"

RUN apt update \
    && apt install -y sudo \
    && apt autoremove --purge \
    && apt autoclean && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/
RUN adduser --disabled-password --shell /bin/bash --uid 1000 --gecos '' user \
    && adduser user sudo \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && echo 'export PATH=/home/user/.local/bin:$PATH' >> /home/user/.bashrc
COPY winfonts /usr/share/fonts/winfonts
RUN fc-cache -fv >> /dev/null 2>&1

USER user
WORKDIR /home/user
CMD ["bash"]