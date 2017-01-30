# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias ggui='/usr/local/opt/git/libexec/git-core/git-gui &'
alias editgit='vim ~/.gitconfig'
