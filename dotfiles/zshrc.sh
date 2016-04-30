# This is symlinked to ~/.zshrc
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
# shellcheck disable=SC2034
ZSH_THEME="maximal"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# shellcheck disable=SC2034
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# shellcheck disable=SC2034
SVN_SHOW_BRANCH="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(aws battery common-aliases docker encode64 extract gem git github history history-substring-search jira lol node npm nyan python rbenv redis-cli rsync ruby screen sudo svn urltools virtualenv virtualenvwrapper)

case "$OSTYPE" in
  darwin*) plugins+=(atom brew brew-cask dash heroku osx osx-security xcode);;
  linux*) plugins+=(debain systemadmin);;
esac

#plugins+=(safe-paste)

source "$ZSH/oh-my-zsh.sh"

# User configuration
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

_KEYS=$(ssh-add -l)
for key in ~/.ssh/id_{dsa,rsa,ed25519}; do
  if [ -f $key ] && [ -f $key.pub ] && ! echo "$_KEYS" | grep -q "$(ssh-keygen -lf $key | awk '{print $2}')"; then
    ssh-add $key
  fi
done
unset _KEYS

if [ -n "$(whence boot2docker)" ]; then
  eval "$(boot2docker shellinit 2>/dev/null)"
fi

if [ -n "$(whence docker-machine)" ]; then
    eval "$(docker-machine env)"
fi

if [ -n "$(whence thefuck)" ]; then
    eval "$(thefuck --alias)"
fi
