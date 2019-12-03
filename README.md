# mario does dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine.

This started from an adaptation of [holman's dotfiles](https://github.com/holman/dotfiles).

Now I am on the 2nd generation so I changed the approach completely to something more similar to xero's [dotfiles](https://github.com/xero/dotfiles).
Basically keeping it super simple and using GNU stow for symlinking files.

## instructions on how to setup this on a clean machine
 - clone https://github.com/marionzualo/dotfiles
 - install home-brew
 - install git  `brew install git`
 - install zsh `brew install zsh`
 - install oh-my-zsh
 - change default shell to zsh (this is likely going to be handed by oh-my-zsh)
 - install tmux `brew install tmux`
 - install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) `brew install zsh-syntax-highlighting`
 - install node `brew install node`
 - install pure - https://github.com/sindresorhus/pure
 - install vim `brew install vim`
 - install vim `brew install nvim`
 - intall exuberant ctags `brew install ctags`
 - remap control key
 - install source code pro `brew tap homebrew/cask-fonts && brew cask install font-source-code-pro`
 - install the silver searcher `brew install the_silver_searcher`
 - install pasteboard `brew install reattach-to-user-namespace`
 - install gitsh https://github.com/thoughtbot/gitsh
 - install GNU stow `brew install stow`
 - `cd ~/dotfiles; stow vim;`
 - Install vim plugins with (:PlugInstall)
 - create `~/dotfiles/git/.gitgc/.gitconfig_machine` with local details
 - `mv ~/.gitconfig ~/.gitconfig.old`
 - `cd ~/dotfiles; stow git;`
 - `mv ~/.zshrc ~/.zshrc.old`
 - `stow zsh`
 - `stow tmux`

## stow instructions
This is mostly copied from xero's dotfiles. Mostly so I can have a quick reminder on how stow works.

by default the stow command will create symlinks for files in the parent directory of where you execute the command. so my dotfiles setup assumes this repo is located in the root of your home directory `~/dotfiles`. and all stow commands should be executed in that directory. otherwise you'll need to use the `-d` flag with the repo directory location.

to install most of my configs you execute the stow command with the folder name as the only argument.

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
+ [iTerm2](http://iterm2.com/)
+ [zsh](http://code.joejag.com/2014/why-zsh.html)
+ [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
+ [tmux](http://aokolish.me/blog/2013/02/12/using-tmux-and-tmuxinator/)
+ [pick](https://github.com/thoughtbot/pick)

## thanks

I forked Zach Holman's excellent [dotfiles](https://github.com/holman/dotfiles) for the first generation of my dotfiles.

The present generation is highly inspired by xero's [dotfiles](https://github.com/xero/dotfiles)
