# mario does dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine.

This started from an adaptation of [holman's dotfiles](https://github.com/holman/dotfiles).

Now I am on the 2nd generation so I changed the approach completely to something more similar to xero's [dotfiles](https://github.com/xero/dotfiles).
Basically keeping it super simple and using GNU stow for symlinking files.

The package contents use Stow's `--dotfiles` mode through `.stowrc`, so files
and directories are named `dot-vimrc`, `dot-config`, `dot-zshrc`, etc. in this
repo while linking to `.vimrc`, `.config`, `.zshrc`, etc. in your home folder.
That keeps the repo easier to browse in Finder without changing the installed
dotfile names.

## instructions on how to setup this on a clean machine
 - install Homebrew from https://brew.sh/
 - clone https://github.com/marionzualo/dotfiles to `~/dotfiles`
 - `cd ~/dotfiles`
 - install Homebrew packages with `./scripts/install-brew-packages`
 - manually install Zed from https://zed.dev/
 - authenticate GitHub CLI with `gh auth login`
 - remap control key
 - `stow vim`
 - Install vim plugins with (:PlugInstall)
 - create `~/dotfiles/git/dot-gitc/dot-gitconfig_machine` with local details
 - `mv ~/.gitconfig ~/.gitconfig.old`
 - `stow git`
 - `mv ~/.zshrc ~/.zshrc.old`
 - `mv ~/.zprofile ~/.zprofile.old`
 - `stow zsh`
 - `stow tmux`

## zsh startup files

The zsh package manages both `.zprofile` and `.zshrc`.

`.zprofile` is intentionally small. macOS starts terminal shells as login
shells, so `.zprofile` is read before `.zshrc`. It sources
`~/.zsh/environment.zsh` for login/session environment such as Homebrew, PATH,
editor, and locale settings.

`.zshrc` is for interactive shells. It also sources `environment.zsh`, then
loads the rest of `~/.zsh/*.zsh` for interactive behavior such as aliases,
history, prompt, and tool initialization. `environment.zsh` keeps PATH entries
unique, so sourcing it from both files is safe.

When adding zsh config:

- Add PATH entries, Homebrew/package-manager environment, `EDITOR`, `LANG`, and
  other exported values to `zsh/dot-zsh/environment.zsh`.
- Add aliases to `zsh/dot-zsh/aliases.zsh`.
- Add history behavior to `zsh/dot-zsh/history.zsh`.
- Add prompt setup to `zsh/dot-zsh/prompt.zsh`.
- Add interactive tool initialization to its own `zsh/dot-zsh/*.zsh` file when
  it affects shell behavior, completions, prompts, aliases, or functions.
- Add machine-specific secrets or one-off local settings to
  `zsh/dot-zsh/local.zsh`; it is ignored by Git.
- Only edit `zsh/dot-zprofile` when changing what all login sessions should
  source. It should usually remain just the shared environment loader.
- Only edit `zsh/dot-zshrc` when changing the overall startup order.

Rule of thumb: if a value should exist for the whole login session, put it in
`environment.zsh`; if it only matters once you are typing commands in a shell,
put it in another `~/.zsh/*.zsh` module.

## stow instructions
This is mostly copied from xero's dotfiles. Mostly so I can have a quick reminder on how stow works.

by default the stow command will create symlinks for files in the parent directory of where you execute the command. so my dotfiles setup assumes this repo is located in the root of your home directory `~/dotfiles`. and all stow commands should be executed in that directory. otherwise you'll need to use the `-d` flag with the repo directory location.

to install most of my configs you execute the stow command with the folder name as the only argument.

`.stowrc` enables `--dotfiles`, which maps repo paths starting with `dot-` to
hidden dotfiles in the target directory. For example, `vim/dot-vimrc` becomes
`~/.vimrc`, and `vim/dot-config/nvim` becomes `~/.config/nvim`.

to install my **herbstluft** theme _greybeard_ use the command:

`stow herbstluftwm`

this will symlink files to `~/.config/herbstluftwm` and various other places.

but you can override the default behavior and symlink files to another location with the `-t` (target) argument flag.

to install the **ryu-login** you need to execute the command:

`stow -t / ryu-login`

this will symlink the file to `/etc/issue`.

**note:** stow can only create a symlink if a config file does not already exist. if a default file was created upon program installation you must delete it first before you can install a new one with stow. this does not apply to directories, only files.

## my overall setup

While this repo only deals with dotfiles management, it exists to support my development
environment setup:
+ [Ghostty](https://ghostty.org/)
+ [zsh](http://code.joejag.com/2014/why-zsh.html)
+ [tmux](http://aokolish.me/blog/2013/02/12/using-tmux-and-tmuxinator/)

## thanks

I forked Zach Holman's excellent [dotfiles](https://github.com/holman/dotfiles) for the first generation of my dotfiles.

The present generation is highly inspired by xero's [dotfiles](https://github.com/xero/dotfiles)
