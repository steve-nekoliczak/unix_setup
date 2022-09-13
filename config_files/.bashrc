# display git branch at prompt when in git repo dir
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\033[32m\]\W\[\033[33m\]\$(git_branch)\[\033[00m\]\$ "
PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

test -f ~/.git-completion.bash && . $_

#
# aliases
#

# standard bash
alias ll="ls -la"
alias lsc="ls -1 | wc -l"
alias c="clear"
alias h="history"
alias grep="grep --color"
alias bashrc="vim $HOME/.bashrc"
alias vimrc="vim $HOME/.vimrc"
# cd aliases
alias home="cd $HOME"
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias ....='cd ../../../../'
# git
alias co="git checkout"
alias br="git branch"
alias pull="git pull"
alias push="git push"
alias pushnew="git push -u origin"
# python
alias seba="source env/bin/activate"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"
