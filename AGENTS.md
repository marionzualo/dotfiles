# Agent Notes

This repo manages personal dotfiles with GNU Stow. Prefer small, focused edits
that preserve the existing package layout.

## Layout

- `.stowrc` enables Stow `--dotfiles` mode.
- Package directories use names like `zsh/dot-zshrc`, `zsh/dot-zsh`,
  `vim/dot-vimrc`, and `git/dot-gitconfig`.
- Installed paths are symlinked into `$HOME`; for example:
  - `zsh/dot-zshrc` -> `~/.zshrc`
  - `zsh/dot-zprofile` -> `~/.zprofile`
  - `zsh/dot-zsh/prompt.zsh` -> `~/.zsh/prompt.zsh`
- Run Stow commands from the repo root, usually `~/dotfiles`.

## Zsh Startup

- `.zprofile` sources `~/.zsh/environment.zsh` for login/session environment.
- `.zshrc` sources `environment.zsh`, then loads each `~/.zsh/*.zsh` module.
- Put PATH, locale, `EDITOR`, and other exported session values in
  `zsh/dot-zsh/environment.zsh`.
- Put aliases in `zsh/dot-zsh/aliases.zsh`.
- Put prompt setup in `zsh/dot-zsh/prompt.zsh`.
- Put machine-specific local settings in `zsh/dot-zsh/local.zsh`; it is ignored
  by Git.

## Prompt

Homebrew installs the `pure` zsh prompt through `scripts/install-brew-packages`.
The prompt setup should tolerate `prompt -l` returning prompt names on one line.
Verify Pure is visible with:

```zsh
zsh -ic 'autoload -U promptinit; promptinit; prompt -l | tr " " "\n" | grep -qx pure && echo pure-found'
```

Verify the prompt module loaded with:

```zsh
zsh -ic 'print -r -- $PROMPT'
```

## Useful Checks

After zsh changes:

```zsh
zsh -ic 'alias ll'
zsh -ic 'source ~/.zshrc'
```

After Stow layout changes:

```zsh
stow --simulate zsh
stow --simulate git
stow --simulate vim
stow --simulate tmux
```

Before reporting final status, check the worktree:

```zsh
git status --short
git diff --stat
```

The repo may already have broad unstaged changes from layout migrations. Do not
revert unrelated changes; only modify files needed for the current task.
