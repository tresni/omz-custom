#! /bin/zsh

for i in ~/.oh-my-zsh/custom/dotfiles/*.sh; do
  ln -sf "$i" ~/.`basename "$i" | sed 's/\.sh//'`
done
