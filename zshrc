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

alias vim="nvim"
