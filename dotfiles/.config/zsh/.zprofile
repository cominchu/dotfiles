# brew
if (( ${+commands[brew]} )); then
    # Avoid the brew doctor warning: 'Putting non-prefixed hogehoge'
    alias brew="env PATH=${(j':')path_default[@]} brew"
fi
# export HOMEBREW_PREFIX="${HOME}/.linuxbrew";
# export HOMEBREW_CELLAR="${HOME}/.linuxbrew/Cellar";
# export HOMEBREW_REPOSITORY="${HOME}/.linuxbrew/Homebrew";
# export PATH="${HOME}/.linuxbrew/bin:${HOME}/.linuxbrew/sbin${PATH+:$PATH}";
# export MANPATH="${HOME}/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
# export INFOPATH="${HOME}/.linuxbrew/share/info:${INFOPATH:-}";

### Docker ###
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

### Node.js ###
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"

### Python ###
if (( ${+commands[pip]} )); then
    export PYTHONUSERBASE="${XDG_DATA_HOME}/pip"
    path=("${PYTHONUSERBASE}/bin"(N-/) "${path[@]}")
    . <(pip completion --zsh)
fi

# pyenv
# Repo: https://github.com/pyenv/pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export VIRTUAL_ENV_DISABLE_PROMPT=1
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# Poetry
# Repo: https://github.com/sdispater/poetry
export POETRY_HOME="${XDG_DATA_HOME}/poetry"
path=("${POETRY_HOME}/bin"(N-/) "${path[@]}")

### Rust ###
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export RUST_BACKTRACE=1
path=("${CARGO_HOME}/bin"(N-/) "${path[@]}")

### alias ###
alias g="git status"