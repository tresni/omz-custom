# RunSnakeRun on OS X barfs unless I use runsnake32
alias runsnake=runsnake32
if [[ $(whence ag) != "" ]]; then
    alias grep='ag'
    alias ack='ag'
    alias ack_='command ack'
    alias grep_='command grep'
elif [[ $(whence ack) != "" ]]; then
    alias grep='ack'
    alias ag='ack'
    alias grep_='command grep'
else
    alias ag='grep'
    alias ack='grep'
fi
