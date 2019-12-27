# "-F":ディレクトリに"/"を表示 / "-G"でディレクトリを色表示
alias ls='ls -FG'
alias ll='ls -alFG'

# default:cyan / root:red
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}
function promps {
    local  CYAN="\[\033[1;36m\]"
    local  BLUE="\[\e[1;34m\]"
    local  RED="\[\e[1;31m\]"
    local  GREEN="\[\e[1;32m\]"
    local  WHITE="\[\e[00m\]"
    local  GRAY="\[\e[1;37m\]"

    case $TERM in
        xterm*) TITLEBAR='\[\e]0;\W\007\]';;
        *)      TITLEBAR="";;
    esac
    local BASE="\u@\h"
    if [ $UID -eq 0 ]; then
        PS1="${TITLEBAR}${RED}${BASE}${WHITE}:${CYAN}\w ${GREEN}\$(parse_git_branch)\n${RED}#${WHITE} "
    else
        PS1="${TITLEBAR}${CYAN}${BASE}${WHITE}:${CYAN}\w ${GREEN}\$(parse_git_branch)\n${BLUE}\$${WHITE} "
    fi
}
promps
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
