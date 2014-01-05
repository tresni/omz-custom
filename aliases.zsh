# RunSnakeRun on OS X barfs unless I use runsnake32
alias runsnake=runsnake32

if [[ $(whence pip-2.7) != "" ]]; then
    alias pip='sudo pip-2.7'
fi
