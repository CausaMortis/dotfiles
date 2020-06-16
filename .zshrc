export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="$HOME/.local/bin:$PATH"

# -----------------------------------------------------------------------------
# Zsh and Oh-My-Zsh
# -----------------------------------------------------------------------------

export ZSH=$HOME/.oh-my-zsh

plugins=(ssh-agent git autojump colorize colored-man-pages composer docker-compose history)
ZSH_THEME=juanghurtado 
COMPLETION_WAITING_DOTS="true"

unsetopt beep

# -----------------------------------------------------------------------------
# Oh-My-Zsh plugins
# -----------------------------------------------------------------------------

zstyle :omz:plugins:ssh-agent identities id_rsa blade_github_rsa  

if [[ -s /home/jordy/.autojump/etc/profile.d/autojump.sh ]]; then
  source /home/jordy/.autojump/etc/profile.d/autojump.sh
  autoload -U compinit && compinit -u
fi

# -----------------------------------------------------------------------------
# Programming Environments
# -----------------------------------------------------------------------------

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"

if command -v nodenv 1>/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

# yarn
export PATH="$(yarn global bin):$PATH"

# composer
export PATH="~/.composer/vendor/bin:$PATH"

# -----------------------------------------------------------------------------
# Post Setup
# -----------------------------------------------------------------------------

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

unalias gm
