# This is symlinked to ~/.zshenv
if [[ "$OSTYPE" == darwin* ]]; then
  export PATH=/Users/$USER/.bin:/opt/local/bin:/opt/local/sbin:/usr/local/MacGPG2/bin:$PATH
fi

# # Preferred editor for local and remote sessions
if [[ -z $SSH_CONNECTION && -n "$(which atom)" ]]; then
    export EDITOR=~/.oh-my-zsh/custom/EDITOR
else
    export EDITOR='nano'
fi

if [ -n "$(whence rbenv)" ]; then
  eval "$(rbenv init -)"
fi

if [ -n "$(which boot2docker)" ]; then
  eval "$(boot2docker shellinit 2>/dev/null)"
fi
