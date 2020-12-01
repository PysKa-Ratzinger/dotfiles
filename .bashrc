# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

source /home/pyska/dotfiles/completion/git-completion.bash
source /home/pyska/dotfiles/completion/git-prompt.sh
source /usr/share/bash-completion/bash_completion
. /home/pyska/.local/share/lscolors.sh

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Removes some "smart" completions
shopt -u progcomp

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# export TERM=xterm-unicode-256color

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

C_RST="\[\033[0m\]"
C_RED="\[\033[0;31m\]"
C_GREEN="\[\033[0;32m\]"
C_YELLOW="\[\033[1;33m\]"
C_NORMAL="\[\033[0;39m\]"
C_CYAN="\[\033[01;96m\]"
C_PURPLE="\[\033[01;35m\]"
C_BLUE="\[\033[01;34m\]"

if [[ ${EUID} == 0 ]]; then
	USER_PROMPT="${C_RED}root"
else
	USER_PROMPT="${C_RST}\u"
fi
USER_PROMPT="$USER_PROMPT${C_GREEN}@${C_RST}\h"

GIT_PROMPT="\$(__git_ps1 \" $C_GREEN(%s)\")"

PS1=" \$([[ \$? != 0 ]] && echo \"${C_RED}NOK\" || echo \"${C_GREEN} OK\")$C_RST "
PS1="$PS1$USER_PROMPT:$C_CYAN\W$C_NORMAL$GIT_PROMPT"
PS1="$PS1 $C_YELLOW$ $C_NORMAL"

#if [ "$color_prompt" = yes ]; then
	#PS1='${debian_chroot:+($debian_chroot)}\e[01;32m\]\u@\h\e[00m\]:\e[01;34m\]\w\e[00m\]\$ '
#else
	#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
		;;
	*)
		;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

export LESS="-R"

[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

export EDITOR=vim
export LANG="en_US.UTF-8"
export PATH="$HOME/.local/bin/:$PATH"
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json

