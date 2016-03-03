#!/bin/sh
alias gl='git log'
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias gpo='git push origin HEAD'
alias gpoa='git push origin --all'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gs='git status -sb'
alias gcb='git-copy-branch-name'
alias gi='git init'

# Git shortcuts
alias gs='git status; git submodule status'
alias ga='git add'
# alias gc='git commit -m'    (See function below)
alias gdc='git diff --cached' # show staged diff (what will be committed)
alias gd1='git diff HEAD' # show unstaged|staged diff (all uncommitted state)
alias gd2='git diff HEAD~1'
alias gd3='git diff HEAD~2'
alias grmall="git status | grep 'deleted:' | awk '{print \$3}' | xargs git rm -f"

alias fix='git commit --amend -C HEAD'
alias ff='git merge --ff-only'
alias squash='git merge --squash --no-commit'
alias gll="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# this command loads one letter aliases on demand


# Git submodule shortcutsc

alias gsa='git submodule add'
alias gsu='git submodule update --init'

# Usage:
#   gc 'bug is fixed'                 # non-interactive mode
#   gc                                # interactive mode
#   Commit message: bug is fixed
#
function gc {
  local commitmessage
  if [ "" = "$1" ]; then
    echo -n 'Commit message: '
    commitmessage="$(ruby -e "puts gets")"
    git commit -m "$commitmessage"
  else
    git commit -m "$1"
  fi
}