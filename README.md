# dotfiles

## Setup

```sh
curl -sSfL https://raw.githubusercontent.com/cominchu/dotfiles/main/install.sh | sh
```

## Test with Docker

```sh
$ cd path/to/Dockerfile
$ docker build -t dotfiles . --build-arg EXEC_USER=$(whoami)
$ docker run -it dotfiles /bin/bash
$ curl -sSfL https://raw.githubusercontent.com/cominchu/dotfiles/main/install.sh | sh
```

## Acknowledgements

- [znppunfuv/dotfiles](https://github.com/znppunfuv/dotfiles): Took a lot of his files.
- [shunk031/dotfiles](https://github.com/shunk031/dotfiles): Inspired by his Test with Docker.
