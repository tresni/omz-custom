# This is symlinked to ~/.zshenv
if [[ "$OSTYPE" == darwin* ]]; then
  export PATH=/Users/$USER/.bin:/opt/local/bin:/opt/local/sbin:/usr/local/MacGPG2/bin:$PATH
fi

# # Preferred editor for local and remote sessions
if [[ -z $SSH_CONNECTION && -n "$(which atom)" ]]; then
    export EDITOR='atom --wait'
else
    export EDITOR='nano'
fi

# boot2docker
if [ -n "$(which boot2docker)" ]; then
  # this should export varibles
  # shellcheck disable=SC2091
  $(boot2docker shellinit 2>/dev/null)
fi
