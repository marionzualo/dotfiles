# mario does dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine.

Most of the code here was taken from [holman's dotfiles](https://github.com/holman/dotfiles).
I tuned it according to my preferences. You can [read the original post on
the subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/). 

## my overall setup

While this repo only deals with dotfiles management, it exists to support my development
environment setup:
+ [iTerm2](http://iterm2.com/)
+ [zsh](http://code.joejag.com/2014/why-zsh.html)
+ [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
+ [tmux](http://aokolish.me/blog/2013/02/12/using-tmux-and-tmuxinator/)

## install

Run this:

```sh
git clone https://github.com/marionzualo/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you.
[Fork it](https://github.com/marionzualo/dotfiles/fork), remove what you don't
use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rbenv` installed, for example. That
said, I do use this as *my* dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/marionzualo/dotfiles/issues) on this repository
and I'd love to get it fixed for you!

## thanks

I forked [Zach Holman's](http://github.com/holman) excellent
[dotfiles](http://github.com/ryanb/dotfiles).
 
