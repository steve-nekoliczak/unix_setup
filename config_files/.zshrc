# History settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Reduce switching delay
KEYTIMEOUT=15

# Standard shell command aliases
alias ll="ls -la"
alias lsc="ls -1 | wc -l"
alias c="clear"
alias h="history"
alias grep="grep --color"
alias sz="source ~/.zshrc"
alias fnd="find . -type f -name"
# cd aliases
alias home="cd $HOME"
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias ....='cd ../../../../'
# git aliases
alias gco="git checkout"
alias gb="git branch"
alias gp="git pull"
alias gps="git push"
alias gpsn="git push -u origin"
alias gl="git log"
alias gs="git status"
alias gf="git fetch"
alias gc="git commit -v"
alias ga="git add"
alias gd="git diff"
alias gds="git diff --staged"

# Ruby language config
alias be="bundle exec"

# Set default editor to neovim
export EDITOR="nvim"

# Add asdf to $PATH
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Use vim hotkeys
bindkey -v

# Map ;a to Escape for vim hotkeys
# That way we can change from insert to normal mode with ;a
bindkey -s ';a' '\e'

# Enable's reverse search
bindkey '^R' history-incremental-search-backward

# Change cursor depending on current vim mode
# Normal mode is a block cursor
# Insert mode is a line cursor
function zle-line-init zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-line-init
zle -N zle-keymap-select

# vcs_info: Show the current dir's git branch in the shell prompt
# compinit: Add the current dir's git branches to zsh's autocomplete
autoload -Uz vcs_info compinit
precmd() { vcs_info compinit }

# Set up the prompt with git branch name
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '%b'
# Alternate prompt with more info
# PROMPT='%F{magenta}[%n@%m] %F{none}% %1d%{%F{green}%}(${vcs_info_msg_0_})%{%F{none}%}$ '
PROMPT='%1d%{%F{green}%}(${vcs_info_msg_0_})%{%F{none}%}$ '

# Uncomment this line if you want git's autocomplete to work for unstaged files. See:
# https://www.reddit.com/r/zsh/comments/hxq3mg/zsh_does_not_autocomplete_directories_for_git/
# setopt COMPLETE_ALIASES

echo "Sourced ~/.zshrc"
