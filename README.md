# mario does dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine.

This started from an adaptation of [holman's dotfiles](https://github.com/holman/dotfiles).

Now I am on the 2nd generation so I changed the approach completely to something more similar to xero's [dotfiles](https://github.com/xero/dotfiles). Basically keeping it super simple and using GNU stow for symlinking files.

## instructions on how to setup this on a clean machine
 - install home-brew
 - install git  `brew install git`
 - install zsh `brew install zsh`
 - install oh-my-zsh
 - change default shell to zsh
 - install tmux `brew install tmux`
 - install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) `brew install zsh-syntax-highlighting`
 - install node `brew install node` 
 - install pure - https://github.com/sindresorhus/pure 
 - install vim `brew install vim`
 - install vim `brew install nvim`
 - clone dotfiles repo to the correct location and run `script/bootstrap`
 - `script/boostrap`
 - intall exuberant ctags `brew install ctags`
 - install cmake `brew install make`
 - Install vim plugins with (:VimPlugged)
 - compile [YCM](https://valloric.github.io/YouCompleteMe)
 - remap control key
 - install source code pro
 - install the silver searcher `brew install the_silver_searcher`
 - install pasteboard `brew install reattach-to-user-namespace`
 - install gitsh https://github.com/thoughtbot/gitsh

## my overall setup

While this repo only deals with dotfiles management, it exists to support my development
environment setup:
+ [iTerm2](http://iterm2.com/)
+ [zsh](http://code.joejag.com/2014/why-zsh.html)
+ [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
+ [tmux](http://aokolish.me/blog/2013/02/12/using-tmux-and-tmuxinator/)
+ [pick](https://github.com/thoughtbot/pick)

## install

TODO 

## thanks

I forked Zach Holman's excellent [dotfiles](https://github.com/holman/dotfiles) for the first generation of my dotfiles.

The present generation is highly inspired by xero's [dotfiles](https://github.com/xero/dotfiles)
 
