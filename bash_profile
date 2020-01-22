#git tab-completion setting
source $HOME/.git-completion.bash
source $HOME/.git-prompt.sh

#tab-completion setting
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
export PATH=/usr/local/Cellar/git/2.21.0/bin:$PATH

# Shortcut
alias sbp='source ~/.bash_profile'
alias vbp='vi ~/.bash_profile'
alias rmd='rm -ri'
alias rn='rename -s'
alias wd='--word-diff-regex="\w+"'
alias ls='ls -FG'
alias ll='ls -alFG'
alias chrome='open -a "Google Chrome"'
alias Safari='open -a Safari index.html'

alias st='git status'

alias glp='npx gulp'
alias glpw='npx gulp watch'

#Shortcut function
function cpfl() {
    cat $1 | pbcopy
}
function ff() {
    find . -name "$1" -ls;
}
function grepff {
    grep -rl "$1" . --include="*.$2"
}
function mkshell {
    if [ -n "$1" ]; then
      touch $1.sh
      echo "#!/bin/bash" > $1.sh
    else
      echo "error:Please enter a file name"
    fi
}
function mkvenv {
    if [ -n "$1" ]; then
      $1 -m venv venv
    else
      python3 -m venv venv
    fi
    source venv/bin/activate
}
function venv {
    if [ $1 = "on" ] ; then
      source venv/bin/activate
    elif [ $1 = "off" ] ; then
      deactivate
    fi
}
function readline {
  if [ $# -eq 2 ]; then
    while read line
      do
      if [ -n "$line" ]; then
        $1
      fi
    done < $2
  else
    echo -e "**usage** \\nFirst argument = Command \\nSecound argument = readfile \\n\$line = readline"
  fi
}
function efind {
  if [ $# -eq 2 ]; then
    find $1 -name $2
  else
    echo "**usage** \\nFirst argument = search dir \\nSecound argument = search text"
  fi
}

#terminal setting PS1
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
function promps {
    local  BLUE="\[\e[1;34m\]"
    local  RED="\[\e[1;31m\]"
    local  GREEN="\[\e[1;32m\]"
    local  WHITE="\[\e[00m\]"
    local  GRAY="\[\e[1;37m\]"
    local  YELLOW="\[\e[1;33m\]"
    local  LPURPLE="\[\e[1;35m\]"

    case $TERM in
        xterm*) TITLEBAR='\[\e]0;\W\007\]';;
        *)      TITLEBAR="";;
    esac
    local BASE="\u@"
    PS1="${TITLEBAR}${WHITE}${BASE}${WHITE}:${BLUE}\w${GREEN}${LPURPLE}\$(parse_git_branch)${WHITE}\$${WHITE} "
}
promps

eval "$(pyenv init -)"

