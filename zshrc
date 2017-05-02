export ZSH=/home/$USER/.oh-my-zsh

ZSH_THEME="mh"
plugins=(git colored-man-pages compleat)

source $ZSH/oh-my-zsh.sh

alias vi=vim
alias v=vim

export EDITOR=vim

function batinfo() {
    while [ true ]
    do
        acpi -b;
        sleep 5;
        clear;
    done
}

function tempinfo() {
    while [ true ]
    do
        acpi -t;
        sleep 5;
        clear;
    done
}

function meminfo() {
    while [ true ]
    do
        free -h;
        sleep 5;
        clear;
    done
}

# --------------------------------------------------
#|            Credit : Chanon BagIdea              |
#|-------------------------------------------------|
#|     "https://github.com/RealtimeBagIdea"        |
#|-------------------------------------------------|
#|     lp = cd to last process working dir         |
#|     cl = cd to last process working dir & ls -a |
#|     reshell = zsh restart                       |
#|     fd = favorite dir                           |
# --------------------------------------------------

function cd_ex() {
    cd $1;
    echo "LASTWD=$PWD" > ~/.lprc
}

function cd_el() {
    cd $1 && ls -a;
    echo "LASTWD=$PWD" > ~/.lprc
}

function lp() {
    source ~/.lprc
    cd $LASTWD
}

function reshell() {
    exec zsh -l
}

alias cd="cd_ex"
alias cl="cd_el"
alias fd="fdir.sh"

FDIR_PATH=/home/$USER/.fdirrc

source $FDIR_PATH
