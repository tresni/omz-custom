# RunSnakeRun on OS X barfs unless I use runsnake32
alias runsnake=runsnake32

if [[ $(whence pip-2.7) != "" ]]; then
    alias pip='sudo pip-2.7'
fi

alias zshconfig="\$EDITOR ~/.zshrc"
alias zshrc="\$EDITOR ~/.zshrc"
alias ohmyzsh="\$EDITOR ~/.oh-my-zsh"
alias omz_custom="\$EDITOR ~/.oh-my-zsh/custom"
alias cls="clr"

if [ -n "$(whence qq)" ]; then
  function qq {
    case "$1" in
      "install" | "upgrade")
        sudo command "qq" "$@"
        ;;
      *)
        command "qq" "$@"
        ;;
    esac
  }
fi
