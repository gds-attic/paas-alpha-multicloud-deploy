
GPG_AGENT=$(which gpg-agent)
GPG_TTY=`tty`
export GPG_TTY
 
if [ -f ${GPG_AGENT} ]; then
    . ~/.bash_gpg
fi
