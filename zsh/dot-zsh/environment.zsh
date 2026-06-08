# Shared environment for both .zprofile and .zshrc.
# Put session-level values here: PATH, locale, editor, and package-manager env.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# zsh keeps PATH in the tied array named path. Marking it unique makes this file
# safe to source from both .zprofile and .zshrc without duplicating entries.
typeset -U path PATH
path=("$HOME/.local/bin" "$HOME/bin" $path)
export PATH

# Preferred editor for local and remote sessions.
export EDITOR=vim
export VISUAL=vim

# Locale/language defaults.
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LESSCHARSET=utf-8
