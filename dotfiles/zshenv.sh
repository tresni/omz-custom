# This is symlinked to ~/.zshenv
if [[ "$OSTYPE" == darwin* ]]; then
  export PATH=/Users/$USER/.bin:/opt/local/bin:/opt/local/sbin:/usr/local/MacGPG2/bin:$PATH
fi

# # Preferred editor for local and remote sessions
if [[ -z $SSH_CONNECTION && -n "$(which atom)" ]]; then
    export EDITOR='atom'
else
    export EDITOR='nano'
fi
