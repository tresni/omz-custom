#! /bin/zsh

for i in ~/.oh-my-zsh/custom/dotfiles/*.sh; do
  ln -sf "$i" ~/.`basename "$i" | sed 's/\.sh//'`
done

if [[ "`uname`" == "Darwin" ]]; then
  # Hook up Homebrew
  if [[ "`whence brew`" == "" ]]; then
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    brew tap homebrew/dupes
    brew install git mtr python tidy jpeg libpng libtiff webp node unrar
  fi

  # Install some python packages
  /usr/local/bin/pip install 3to2 dnspython flake8 mitmproxy pyenchant
  /usr/local/bin/pip install --pre guess_language-spirit

  # Gems
  sudo gem install rubocop jekyll

  # Node.js
  /usr/local/bin/npm install -g csslint coffeelint htmlhint jshint jsonlint

  if [[ "`whence apm`" == "" ]]; then
    curl -Lo ~/atom.zip https://atom.io/download/mac
    unzip ~/atom.zip -d /Applications
    rm -f ~/atom.zip

    "/Applications/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm" install Zen atom-lint atom-soda-dark-ui dash language-applescript language-salesforce lorem-ipsum minimap minimap-find-and-replace minimap-git-diff minimap-highlight-selected monokai monokai-soda script unity-ui
    "/Applications/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm" install uglify pretty-json atom-beautify file-icons sublime-style-column-selection
  fi
fi
