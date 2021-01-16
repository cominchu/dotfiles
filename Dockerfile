# Copyright (c) 2020 Shunsuke KITADA
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


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
