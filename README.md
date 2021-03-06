# Dotfiles

As inspired by [Zach Holman's Dotfiles][holman]. See [his Readme](https://github.com/holman/dotfiles#holman-does-dotfiles) for more info.

## Installation

- `git clone git://github.com/jsvensson/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `rake install`

The install rake task will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked from within `~/.dotfiles`.

## Caveat Lector

I use [oh-my-zsh][ohzsh] combined with my dotfiles in this repo. As such, be aware that `$ZSH` points
to `~/.oh-my-zsh`, while `$DOTZSH` points to `~/.dotfiles`.

[holman]: https://github.com/holman/dotfiles
[ohzsh]: https://github.com/robbyrussell/oh-my-zsh