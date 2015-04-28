ZSH_THEME_GIT_PROMPT_PREFIX=" %{$reset_color%}%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$reset_color%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%}"
ZSH_THEME_SCM_PROMPT_PREFIX=$ZSH_THEME_GIT_PROMPT_PREFIX
ZSH_THEME_SCM_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
ZSH_THEME_SVN_PROMPT_PREFIX=$ZSH_THEME_GIT_PROMPT_PREFIX
ZSH_THEME_SVN_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
ZSH_THEME_SVN_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_DIRTY
ZSH_THEME_SVN_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN
ZSH_THEME_HG_PROMPT_PREFIX=$ZSH_THEME_GIT_PROMPT_PREFIX
ZSH_THEME_HG_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
ZSH_THEME_HG_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_DIRTY
ZSH_THEME_HG_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN


vcs_status() {
    if [[ $(whence in_svn) != "" ]] && in_svn; then
        svn_prompt_info
    elif [[ $(whence in_hg) != "" ]] && in_hg; then
        hg_prompt_info
    else
        git_prompt_info
    fi
}

exit_status() {
    local EXIT_STATUS
    if [ -n "${__MAXIMAL_EXIT_CMD}" ]; then
        EXIT_STATUS="${__MAXIMAL_TEMP_STATUS}"
    else
        EXIT_STATUS="__NONE__"
    fi

    local PRETTY_STATUS="●%{$reset_color%}"
    case "$EXIT_STATUS" in
        0) PRETTY_STATUS="%{$fg[green]%}$PRETTY_STATUS";;
        "__NONE__") PRETTY_STATUS="%{$fg[yellow]%}$PRETTY_STATUS";;
        *) PRETTY_STATUS="%{$fg[red]%}$PRETTY_STATUS";;
    esac
    echo -n "$PRETTY_STATUS"
}

preexec() {
    __MAXIMAL_EXIT_CMD="${1}"
}

host_status() {
  if [[ -n "$SSH_CONNECTION" ]]; then
    echo '%m '
  fi
}

build_prompt() {
  __MAXIMAL_TEMP_STATUS="$?"
  echo "$(host_status)%2~ $(exit_status)%B»%b "
  unset __MAXIMAL_TEMP_STATUS __MAXIMAL_EXIT_CMD
}

PROMPT='$(build_prompt)'
RPROMPT=' %B«$b$(vcs_status)'
