# This is symlinked to ~/.zshenv
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2

if [[ "$OSTYPE" == darwin* ]]; then
  export PATH=$PATH:/Users/$USER/.bin
fi

# # Preferred editor for local and remote sessions
if [[ -z $SSH_CONNECTION && -n "$(whence atom)" ]]; then
    export EDITOR=~/.oh-my-zsh/custom/EDITOR
else
    EDITOR="$(whence nano)"
    export EDITOR
fi

export PROJECT_HOME="$HOME/Projects/"
export WORKON_HOME="$HOME/.virtualenvs"

if [[ -n "$(whence go)" ]]; then
    export GOPATH="$HOME/golang"
    export GOROOT="/usr/local/opt/go/libexec"
    export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"
fi
