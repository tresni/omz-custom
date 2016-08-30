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

function _quadra_wrapper {
    _command=$1
    shift 1

    case "$1" in
        "install" | "upgrade")
            sudo command "${_command}" "$@"
            if [ -n "$(whence brew)" ]; then
                echo "Fixing permissions for Homebrew"
                sudo chown -R "$(whoami):admin" "$(brew --prefix)/lib/python2.7/site-packages"
            fi
            ;;
        *)
            command "${_command}" "$@"
            ;;
    esac
}

if [ -n "$(whence qq)" ]; then
    alias qq="_quadra_wrapper qq"
    alias dcqq="QUADRA_APISERVER=https://api.quadra.p1.usw2.opendns.com qq"
    alias qqdc="QUADRA_APISERVER=https://api.quadra.p1.usw2.opendns.com qq"
fi

if [ -n "$(whence quake)" ]; then
    alias quake="_quadra_wrapper quake"
fi
