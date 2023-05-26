# dotfiles 🏠

My dotfiles, managed via [chezmoi](https://www.chezmoi.io).

## General concepts

- [🐟 Fish](https://fishshell.com) as my shell. POSIX compatibility be damned.
- [🚀 Starship](https://starship.rs) as prompt enhancement.
- [🍺 Homebrew](https://brew.sh) as package manager for macOS.

## Prompt enhancements

I make heavy use of [fzf](https://github.com/junegunn/fzf) for productivity features from the terminal. Some of the keybindings I use:

- `Ctrl-R`: search shell history
- `Ctrl-V`: search environment variables
- `Ctrl-G G`: navigate to git repositories
  - This uses `~/git/` as the base directory using [ghq](https://github.com/x-motemen/ghq)
- `Ctrl-G B`: navigate git branches while in a repository
- `Ctrl-F`: search files under `pwd` recursively
- `Ctrl-D`: navigate to directories under `pwd` recursively

## WIP: Installation

I have yet to do a fresh install from scratch on a new computer, so this section is still highly theoretical.

- Install Homebrew
- Install chezmoi via Homebrew: `brew install chezmoi`
