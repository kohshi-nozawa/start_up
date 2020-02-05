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
function comp {
  if [ $# -gt 2 ]; then
    echo '圧縮形式（拡張子）を小文字で入力してください'
    read key
    case "$key" in
      "zip" ) zip $1 ${2};;
      "gzip" | "gz" ) tar -cf $1 ${2}\; gzip $1;;
      "Z" ) tar -cf $1 ${2}\; compress $1;;
      "bz2" | "bzip2" ) tar -cf $1 ${2}\; bzip2 $1;;
      "tar.gz" | "tgz" ) tar -cfz $1 ${2};;
      "tar.Z" | "taz" ) tar -cfZ $1 ${2};;
      "tar.bz2" | "tbz2" ) tar -cfj $1 ${2};;
    esac
  else
    echo -e '引数が指定されていません\n<使用方法>\ncomp 圧縮後ファイル名 圧縮対象ファイル1 ...'
  fi
}
function uncomp {
  if [ $# -eq 1 ]; then
    echo '圧縮形式（拡張子）を小文字で入力してください'
    read key
    case "$key" in
      "zip" ) unzip $1;;
      "gzip" | "gz" ) gzip -d $1;;
      "Z" ) uncompress -d $1;;
      "bz2" | "bzip2" ) bzip2 -d $1;;
      "tar.gz" | "tgz" ) tar + gzip $1;;
      "tar.Z" | "taz" ) tar -xfZ $1;;
      "tar.bz2" | "tbz2" ) tar -xfj $1;;
    esac
  else
    echo -e '引数が不正です\n<使用方法>\nuncomp 解凍対象ファイル名'
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

