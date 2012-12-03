# To use: add a .jira-url file in the base of your project
# Setup: cd to/my/project
#        echo "https://name.jira.com" >> .jira-url
# Usage: jira           # opens a new issue
#        jira ABC-123   # Opens an existing issue
open_jira_issue () {
  if [ -f .jira-url ]; then
    jira_url=$(cat .jira-url)
  elif [ -f ~/.jira-url ]; then
    jira_url=$(cat ~/.jira-url)
  elif [[ "x$JIRA_URL" != "x" ]]; then
    jira_url=$JIRA_URL
  else
    echo "JIRA url is not specified anywhere."
    return 0
  fi

  if [ -z "$1" ]; then
    echo "Opening new issue"
    `open $jira_url/secure/CreateIssue!default.jspa`
  else
    echo "Opening issue #$1"
    if [[ "x$JIRA_RAPID_BOARD" = "yes" ]]; then
      `open $jira_url/issues/$1`
    else
      `open $jira_url/browse/$1`
    fi
  fi
}

alias jira='open_jira_issue'
