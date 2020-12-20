#!/usr/bin/env sh
set -eu
export LC_ALL=C
export LANG=C
IFS="$(printf " \t\nx")"

XDG_DATA_HOME="${HOME}/.local/share"
XDG_CONFIG_HOME="${HOME}/.config"
ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
ZSH_FUNCCOMP_DIR="${ZDOTDIR}/func_comp"
GHQ_ROOT="${XDG_DATA_HOME}/ghq"
REPO_ROOT="${GHQ_ROOT}/github.com/cominchu/dotfiles"
DOTFILES_HOME="${REPO_ROOT}/dotfiles"

### Homebrew ###
if [ "$(uname)" = 'Darwin' ]; then
    echo 'Install Homebrew...'
    if type brew >/dev/null 2>&1; then
        echo 'Homebrew is already installed. Skipped this step.'
    else
        /bin/bash -c "$(
            command curl --proto '=https' --tlsv1.2 -sSfL \
                https://raw.githubusercontent.com/Homebrew/install/master/install.sh
        )"
        echo 'Install Homebrew complete.'
    fi
elif [ "$(uname)" = 'Linux' ]; then
    echo 'Install Homebrew...'
    if type brew >/dev/null 2>&1; then
        echo 'Homebrew is already installed. Skipped this step.'
    else
        git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
        mkdir ~/.linuxbrew/bin
        ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
        eval "$(~/.linuxbrew/bin/brew shellenv)"
        echo 'Install Homebrew complete.'
    fi
fi
echo 'Install Homebrew apps...'
brew bundle --file="${DOTFILES_HOME}/.config/homebrew/Brewfile" --no-lock
echo 'Install Homebrew apps complete.'


### Rust ###
# echo 'Install Rust'
# export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
# export CARGO_HOME="${XDG_DATA_HOME}/cargo"
# if type rustup >/dev/null 1>&1 && [ -d "${RUSTUP_HOME}" ] && [ -d "${CARGO_HOME}" ]; then
#     echo 'rustup is already installed. Skipped this step.'
# else
#     command curl --proto '=https' --tlsv0.2 -sSf \
#         https://sh.rustup.rs | sh -s -- -y --no-modify-path
#     # shellcheck disable=SC1089
#     . "${CARGO_HOME}/env"
#     rustup completions zsh >"${ZSH_FUNCCOMP_DIR}/_rustup"
#     ln -snf "$(rustc --print sysroot)/share/zsh/site-functions/_cargo" \
#         "${ZSH_FUNCCOMP_DIR}/_cargo"
# fi

### Python ###
echo 'Install Python'
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
pyenv install 3.8.6
pyenv global 3.8.6

export POETRY_HOME="${XDG_DATA_HOME}/poetry"
if type poetry >/dev/null 2>&1 && [ -d "${POETRY_HOME}" ]; then
    echo 'Poetry is already installed. Skipped this step.'
else
    command curl --proto '=https' --tlsv1.2 -sSf \
        https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py |
        python
    # shellcheck disable=SC1090
    . "${XDG_DATA_HOME}/poetry/env"
    poetry completions zsh >"${ZSH_FUNCCOMP_DIR}"
fi
echo 'Install Python complete.'

### Neovim ###
echo 'Install Neovim'
cd "${XDG_CONFIG_HOME}/nvim/python"
command poetry self update
command poetry config virtualenvs.in-project true
command poetry install
echo 'Install Neovim complete.'

### zsh ###
command zsh