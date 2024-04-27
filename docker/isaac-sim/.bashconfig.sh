
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=30000
HISTFILESIZE=300000000
# share history
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias sss=". ~/robot_ros_application/catkin_ws/devel/setup.sh"
alias startrobot="sss;. ~/robot_ros_application/scripts/start.sh"
alias ro="cd ~/robot_ros_application/"
alias killa="sudo killall roslaunch"
bind '"\e[A": history-search-backward' 
bind '"\e[B": history-search-forward'
export GIT_SSL_NO_VERIFY=1
alias exp="export DISPLAY=:0.0"

