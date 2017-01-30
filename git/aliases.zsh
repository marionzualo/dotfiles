# The rest of my fun git aliases
alias gd='git diff'
alias gpb='git checkout $(git branch | cut -c 3- | pick)'
alias gcb='git copy-branch-name'
alias gdb='git branch -D $(git branch | cut -c 3- | pick)'
alias gpri='git rebase -i $(git branch | cut -c 3- | pick)'
alias ggui='/usr/local/opt/git/libexec/git-core/git-gui &'
alias gm='git merge'
alias editgit='vim ~/.gitconfig'
