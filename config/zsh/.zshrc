# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
pfetch
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh

# Base
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/ZSH/history

# Autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Variables
export GOPATH=$HOME/.local/src/go
export PATH=$PATH:$HOME/.local/bin/

# Alias
alias ls="ls --color"
alias vim="nvim"

# Plugins
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/zsh-vi-mode.zsh
source ~/.config/zsh/zsh-autosuggestions.zsh
