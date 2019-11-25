export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="$HOME/.local/bin:$PATH"

# -----------------------------------------------------------------------------
# Zsh and Oh-My-Zsh
# -----------------------------------------------------------------------------

export ZSH=$HOME/.oh-my-zsh

plugins=(ssh-agent git autojump colorize colored-man-pages)
ZSH_THEME=juanghurtado 
COMPLETION_WAITING_DOTS="true"

unsetopt beep

# -----------------------------------------------------------------------------
# Oh-My-Zsh plugins
# -----------------------------------------------------------------------------

zstyle :omz:plugins:ssh-agent identities id_rsa blade_github_rsa blade_gitlab_rsa 

if [[ -s /home/jordy/.autojump/etc/profile.d/autojump.sh ]]; then
  source /home/jordy/.autojump/etc/profile.d/autojump.sh
fi

# -----------------------------------------------------------------------------
# Programming Environment Managers
# -----------------------------------------------------------------------------

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"

if command -v nodenv 1>/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# yarn
export PATH="$(yarn global bin):$PATH"

# composer
export PATH="~/.composer/vendor/bin:$PATH"

# -----------------------------------------------------------------------------
# Programming Environments and DBMS
# -----------------------------------------------------------------------------

# python
APP_ENV=dev
PYTHONDONTWRITEBYTECODE="true"

# pgsql
export PGUSER=postgres


# -----------------------------------------------------------------------------
# WSL - Microsoft subsystem for Linux
# -----------------------------------------------------------------------------
export DOCKER_HOST=tcp://0.0.0.0:2375
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"


# -----------------------------------------------------------------------------
# Post Setup
# -----------------------------------------------------------------------------

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

unalias gm
