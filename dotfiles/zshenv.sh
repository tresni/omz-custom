# This is symlinked to ~/.zshenv
if [[ "$OSTYPE" == darwin* ]]; then
  export PATH=/Users/$USER/.bin:$PATH
fi

# # Preferred editor for local and remote sessions
if [[ -z $SSH_CONNECTION && -n "$(whence atom)" ]]; then
    export EDITOR=~/.oh-my-zsh/custom/EDITOR
else
    EDITOR="$(whence nano)"
    export EDITOR
fi
