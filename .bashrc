[ -z "$PS1" ] && return


NONE="\[\033[0m\]" # clear

## Fonte
K="\[\033[0;30m\]" # Black
R="\[\033[0;31m\]" # Red
G="\[\033[0;32m\]" # Green
Y="\[\033[0;33m\]" # Yellow
B="\[\033[0;34m\]" # Blue
M="\[\033[0;35m\]" # Magenta
C="\[\033[0;36m\]" # Cyan
W="\[\033[0;37m\]" # White

## bold
BK="\[\033[1;30m\]" # Bold+Black
BR="\[\033[1;31m\]" # Bold+Red
BG="\[\033[1;32m\]" # Bold+Green
BY="\[\033[1;33m\]" # Bold+Yellow
BB="\[\033[1;34m\]" # Bold+Blue
BM="\[\033[1;35m\]" # Bold+Magenta
BC="\[\033[1;36m\]" # Bold+Cyan
BW="\[\033[1;37m\]" # Bold+White

## backgroud
BGK="\[\033[40m\]" # Black
BGR="\[\033[41m\]" # Red
BGG="\[\033[42m\]" # Green
BGY="\[\033[43m\]" # Yellow
BGB="\[\033[44m\]" # Blue
BGM="\[\033[45m\]" # Magenta
BGC="\[\033[46m\]" # Cyan
BGW="\[\033[47m\]" # White

if [ $UID -eq "0" ]; then
	PS1="$G┌─[$BR\u$G]$BY@$G[$BW${HOSTNAME%%.*}$G]$B:\w\n$G└──>$BR \\$ $NONE"
else
	PS1="$BR┌─[$BG\u$BR]$BY@$BR[$BW${HOSTNAME%%.*}$BR]$B:\w\n$BR└──>$BG \\$ $NONE"
fi

if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

LOCAL_BIN=${HOME}/.local/bin
if [ -d "$LOCAL_BIN" ]; then
	PATH=${PATH}:${LOCAL_BIN}
fi

export TERM=vt100