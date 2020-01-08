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
alias cd_muji='cd ~/Document/muji/01_code'
alias server='node ~/Document/muji/01_code/http_server.js'
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

#drupal setting
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

eval "$(pyenv init -)"

