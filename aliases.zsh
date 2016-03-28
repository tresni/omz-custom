# RunSnakeRun on OS X barfs unless I use runsnake32
alias runsnake=runsnake32
alias zshconfig="\$EDITOR ~/.zshrc"
alias zshrc="\$EDITOR ~/.zshrc"
alias ohmyzsh="\$EDITOR ~/.oh-my-zsh"
alias omz_custom="\$EDITOR ~/.oh-my-zsh/custom"
alias cls="clr"

if [ -e "$HOME/VPNThings/VPN.sh" ]; then
  alias vpn="\$HOME/VPNThings/VPN.sh"
fi

if [ -n "$(whence qq)" ]; then
  function qq {
    case "$1" in
      "install" | "upgrade")
        sudo command "qq" "$@"
        if [ -n "$(whence brew)" ]; then
          echo "Fixing permissions for Homebrew"
          sudo chown -R "$(whoami):admin" "$(brew --prefix)/lib/python2.7/site-packages"
        fi
        ;;
      *)
        command "qq" "$@"
        ;;
    esac
  }
fi

if [ -n "$(whence quake)" ]; then
  function quake {
    case "$1" in
      "install" | "upgrade")
        sudo command "quake" "$@"
        if [ -n "$(whence brew)" ]; then
          echo "Fixing permissions for Homebrew"
          sudo chown -R "$(whoami):admin" "$(brew --prefix)/lib/python2.7/site-packages"
        fi
        ;;
      *)
        command "quake" "$@"
        ;;
    esac
  }
fi
