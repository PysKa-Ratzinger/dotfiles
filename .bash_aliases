alias defcon-start='nohup mplayer -playlist http://somafm.com/defcon130.pls >/dev/null 2>&1 &'
alias dnb-start='nohup mplayer http://source.dnbradio.com:8000/dnbradio_main.mp3 >/dev/null 2>&1 &'
alias radio-stop='killall mplayer'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
        if test -r ~/.dircolors; then
                eval "$(dircolors -b ~/.dircolors)"
        else
                eval "$(dircolors -b)"
        fi
        alias ls='ls --color=auto --group-directories-first'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'

        alias ip='ip --color=auto'
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
else
        alias ls='ls --group-directories-first'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias tree="tree -I 'venv|node_modules|__pycache__'"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lg='lazygit'
alias dd='dd status=progress'
alias vim='nvim'
alias _='sudo'
alias _i='sudo -i'
alias please='sudo'
alias fucking='sudo'

# Shakespearean style exiting :P
alias exunt='exit'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
