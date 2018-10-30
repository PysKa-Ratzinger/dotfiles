#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lav'
alias vim='nvim'

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/ssl/lib

