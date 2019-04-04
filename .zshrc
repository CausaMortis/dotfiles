export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="$HOME/.local/bin:$PATH"

# -----------------------------------------------------------------------------
# Zshell and oh-my-zsh
# -----------------------------------------------------------------------------

export ZSH=$HOME/.oh-my-zsh

plugins=(git pow)                             # standard oh-my-zsh plugins
ZSH_THEME=juanghurtado                        # the lovely juang hurtado
COMPLETION_WAITING_DOTS="true"                # display red dots awaiting completion of executed command

unsetopt beep

# -----------------------------------------------------------------------------
# SSH
# -----------------------------------------------------------------------------

env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
  (umask 077; ssh-agent >| "$env")
  . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
  agent_start
  ssh-add ~/.ssh/github_99linesofcode_rsa
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
  ssh-add ~/.ssh/github_99linesofcode_rsa
fi

unset env

# -----------------------------------------------------------------------------
# Programming Environment Managers
# -----------------------------------------------------------------------------

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"

if command -v nodenv 1>/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi


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

eval $(ssh-agent -s)


# sudo mount --bind /mnt/d /d               # WSL - bind custom mount points to fix Docker for Windows and WSL differences
