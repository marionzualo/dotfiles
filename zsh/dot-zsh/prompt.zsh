autoload -U promptinit; promptinit

if prompt -l | tr ' ' '\n' | grep -qx pure; then
  prompt pure
fi
