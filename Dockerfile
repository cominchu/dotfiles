# Copyright (c) 2020 Shunsuke KITADA
# This file is released under the MIT License, see LICENSE.
# URL: https://github.com/shunk031/dotfiles/blob/master/LICENSE

FROM ubuntu:18.04 as myenv
ENV LANG en_US.UTF-8
ENV TERM screen-256color
ARG EXEC_USER=cominchu
RUN useradd --create-home ${EXEC_USER}
RUN apt-get update && apt-get install -y \
    build-essential curl wget sudo \
    git \
    fontconfig \
    language-pack-en \
    zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libffi-dev \
    python \
    vim
USER ${EXEC_USER}
WORKDIR /home/${EXEC_USER}

# FROM myenv as brew
# RUN git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew  \
#     && mkdir ~/.linuxbrew/bin \
#     && ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin \
#     && eval "$(~/.linuxbrew/bin/brew shellenv)" \
#     && echo 'brew "hello"' >> Brewfile \
#     && brew bundle
