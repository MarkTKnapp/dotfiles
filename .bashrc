#Setup prompt message
BLUE='\[\e[0;34m\]'
RED='\[\e[0;31m\]'
YELLOW='\[\e[0;33m\]'
DF='\[\e[0m\]'
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

get_battery() {
    if [ $(uname) != "Darwin" ] ; then
        return
    fi
    battery=$(pmset -g batt | grep Internal | awk '{print $3}' | sed 's/[^0-9]*//g')
    DF='\x1B[0m'
    if [ $battery -lt 10 ]; then
        RED='\x1B[05;41;37m'
        echo -e "${RED} Low Battery ${DF}"
    elif [ $battery -lt 20 ]; then
        RED='\x1B[01;31m'
        echo -e "${RED}Low Battery${DF}"
    fi
}

export PS1="${RED}\u${DF} \w${YELLOW}\$(parse_git_branch)${DF} \$(get_battery) $\n"

#Setup environment variables
export PATH=$PATH:~/bin/

alias l='ls -lah'
