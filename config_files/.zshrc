#
# history settings
#

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#
# prompt settings
#

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
setopt PROMPT_SUBST
PROMPT='%1d%{%F{green}%}$(parse_git_branch)%{%F{none}%}$ '

#
# vim settings
#

bindkey -v

# reduce switching delay
KEYTIMEOUT=15

bindkey -s ';a' '\e'

# change cursor depending on current vim mode
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

#
# hotkeys
#

bindkey -M vicmd '^n' clear-screen
bindkey -M viins '^n' clear-screen
bindkey '^R' history-incremental-search-backward

#
# aliases
#

# standard shell commands
alias ll="ls -la"
alias lsc="ls -1 | wc -l"
alias c="clear"
alias h="history"
alias grep="grep --color"
# cd aliases
alias home="cd $HOME"
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias ....='cd ../../../../'
# git
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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# direnv setup for Haskell IHP
# https://direnv.net/docs/hook.html
eval "$(direnv hook zsh)"
