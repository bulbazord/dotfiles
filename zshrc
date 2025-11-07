# Save all the history
HISTSIZE=130000
SAVEHIST=130000

# Use vim keybindings to edit the command line
bindkey -v
bindkey '^R' history-incremental-search-backward

export EDITOR='nvim'
export VISUAL='nvim'
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_CASK_OPTS='--appdir=/Applications'
export LANG=en_US.UTF-8

if [[ "$(uname -s)" == "Darwin" ]]; then
  # Colorized output for `ls`
  export CLICOLOR=1
fi

if [[ "$(uname -s)" == "Linux" ]]; then
  export PS1="%n@%m %1~ %# "
  alias ls="ls --color=auto"
fi

alias vim="nvim"
