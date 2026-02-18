# dotfiles

macOS dotfiles managed with [chezmoi](https://www.chezmoi.io). [Ayu Mirage](https://ayutheme.com/) theme throughout.

## What's included

See [.Brewfile](dot_Brewfile) for the main list of installed packages. Homebrew is the main package manager, but there are some manual steps below.

## Where's NeoVim?

It was a bit of a hassle to keep my NeoVim config managed by Chezmoi, as that gets frequently updated and it felt like a lot of friction to first update the NeoVim config, and then add the changes to Chezmoi's management. I broke it out into [jsvensson/nvim](https://github.com/jsvensson/nvim) instead.

## Quick start

One-liner on a fresh Mac:

```sh
bash <(curl -fsSL https://raw.githubusercontent.com/jsvensson/dotfiles/main/setup.sh)
```

Or manually:

```sh
brew install chezmoi
chezmoi init --apply jsvensson
```

The bootstrap script handles Xcode CLI tools, Homebrew, chezmoi, Brewfile, Fish as default shell, Fisher plugins, tpm, and NeoVim config clone.

## Key bindings (fzf)

| Binding | Action |
|---|---|
| `Ctrl-R` | Search shell history (Atuin) |
| `Ctrl-V` | Search environment variables |
| `Ctrl-F` | Search files recursively |
| `Ctrl-D` | Navigate directories recursively |
| `Ctrl-G G` | Navigate to git repos (ghq, `~/git/`) |
| `Ctrl-G B` | Switch git branches |

## Manual post-setup steps

1. **1Password** -- install, enable SSH agent (git signing + SSH auth)
2. **tmux plugins** -- open tmux, press `Ctrl-A I`
3. **NeoVim** -- open nvim, let lazy.nvim install plugins
