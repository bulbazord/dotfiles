# Save all the history
HISTSIZE=130000
SAVEHIST=130000

# Use vim keybindings to edit the command line
bindkey -v
bindkey '^R' history-incremental-search-backward

export EDITOR='vim'
export VISUAL='vim'
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_CASK_OPTS='--appdir=/Applications'
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"

if [[ "$(uname -s)" == "Darwin" ]]; then
  alias tmux="TERM=screen-256color-bce tmux"
  # Colorized output for `ls`
  export CLICOLOR=1
fi

alias vim="nvim"
