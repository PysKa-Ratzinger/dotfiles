# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

source ~/dotfiles/completion/git-completion.bash
source ~/dotfiles/completion/git-prompt.sh
source /usr/share/bash-completion/bash_completion

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTSIZE=100000
HISTFILESIZE=400000
HISTFILE=~/.histfile

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Removes some "smart" completions
shopt -u progcomp

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

#export TERM=xterm-256color
#export TERM=xterm-kitty

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
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
C_CYAN="\[\033[01;96m\]"
C_PURPLE="\[\033[01;35m\]"
C_BLUE="\[\033[01;34m\]"
C_LGRAY="\[\033[00;37m\]"

C2_RST="\033[0m"
C2_RED="\033[0;31m"
C2_GREEN="\033[1;32m"
C2_YELLOW="\033[1;33m"
C2_CYAN="\033[01;96m"
C2_PURPLE="\033[01;35m"
C2_BLUE="\033[01;34m"
C2_LGRAY="\033[00;37m"

if [[ ${EUID} == 0 ]]; then
	USER_PROMPT="${C_RED}root"
else
	USER_PROMPT="${C_LGRAY}\u"
fi
USER_PROMPT="$USER_PROMPT${C_GREEN}@${C_LGRAY}\h"

GIT_PROMPT="\$(__git_ps1 \" $C_YELLOW(%s)\")${C_LGRAY}"

PS1_SMILEY="\$([[ \$? != 0 ]] && echo \"${C_RED}:(\" || echo \"${C_GREEN}:)\")${C_LGRAY}"
PS1="${RST}[$USER_PROMPT:$C_CYAN\W${C_RST}]$GIT_PROMPT"
PS1="$PS1 ${PS1_SMILEY} $C_RST"

#if [ "$color_prompt" = yes ]; then
#PS1='${debian_chroot:+($debian_chroot)}\e[01;32m\]\u@\h\e[00m\]:\e[01;34m\]\w\e[00m\]\$ '
#else
#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
*) ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		source /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		source /etc/bash_completion
	fi
fi

export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus

export LESS="-LR"
export LESSOPEN=
export LESSCLOSE=

[[ -f ~/.LESS_TERMCAP ]] && source ~/.LESS_TERMCAP

export EDITOR=nvim
export LANG="en_US.UTF-8"
export PATH="$HOME/.local/bin/${PATH:+:$PATH}"

# source ~/.lscolors.sh

export GPG_TTY="$(tty)"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}/usr/local/lib:/usr/local/lib64"

#printf "${C2_RED}おかえり、先生。今は${C2_RST} "
#printf "${C2_CYAN}$(date -R)${C2_RST}\n\n"

# Emulate an MS-DOS prompt in your Linux shell.
# Laszlo Szathmary (jabba.laci@gmail.com), 2011
# Project home page:
# https://ubuntuincident.wordpress.com/2011/02/08/emulate-the-ms-dos-prompt/
#
#
# Modified by Soldier of Fortran
#
# Add to you ~/.bashrc file with: 'source ~/.themes/95/bashrc'

#function msdos_pwd
#{
#    pwd | sed 's|\\|\\\\|g; s|/|\\|g;'
#}
#
#export PS1='C:`msdos_pwd`> '
#
#echo
#echo
#echo "Microsoft(R) Windows 95"
#echo "   (C)Copyright Microsoft Corp 1981-1996."
#echo
