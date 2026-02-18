#!/usr/bin/env bash
set -euo pipefail

# --- Colors and helpers ---
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
fail() { echo -e "${RED}[FAIL]${NC} $1"; exit 1; }
skip() { echo -e "${GREEN}[SKIP]${NC} $1 already installed"; }

# --- Paths ---
FISH_PATH="/opt/homebrew/bin/fish"
TPM_DIR="$HOME/.config/tmux/plugins/tpm"
NVIM_DIR="$HOME/.config/nvim"
FISHER_FUNCTIONS="$HOME/.config/fish/functions/fisher.fish"

echo ""
echo "=== Dotfiles Bootstrap ==="
echo ""

# --- Step 1: Xcode CLI tools ---
if xcode-select -p &>/dev/null; then
  skip "Xcode CLI tools"
else
  info "Installing Xcode CLI tools..."
  xcode-select --install
  echo "Press any key after Xcode CLI tools finish installing..."
  read -n 1 -s < /dev/tty
fi

# --- Step 2: Homebrew ---
if command -v brew &>/dev/null; then
  skip "Homebrew"
else
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# --- Step 3: Chezmoi ---
if command -v chezmoi &>/dev/null; then
  skip "chezmoi"
else
  info "Installing chezmoi..."
  brew install chezmoi
fi

# --- Step 4: Chezmoi init + apply ---
if [ -d "$HOME/.local/share/chezmoi" ]; then
  info "Chezmoi already initialized, running apply..."
  chezmoi apply
else
  info "Initializing chezmoi from jsvensson/dotfiles..."
  chezmoi init --apply jsvensson
fi

# --- Step 5: Brew bundle ---
if [ -f "$HOME/.Brewfile" ]; then
  info "Installing Homebrew packages from Brewfile..."
  brew bundle --file="$HOME/.Brewfile"
else
  fail "~/.Brewfile not found — chezmoi apply may have failed"
fi

# --- Step 6: Fish as default shell ---
current_shell=$(dscl . -read /Users/"$USER" UserShell | awk '{print $2}')
if [ "$current_shell" = "$FISH_PATH" ]; then
  skip "Fish as default shell"
else
  if ! grep -q "$FISH_PATH" /etc/shells; then
    info "Adding fish to /etc/shells (needs sudo)..."
    echo "$FISH_PATH" | sudo tee -a /etc/shells >/dev/null
  fi
  info "Setting fish as default shell..."
  chsh -s "$FISH_PATH"
fi

# --- Step 7: Fisher ---
if [ -f "$FISHER_FUNCTIONS" ]; then
  skip "Fisher"
else
  info "Installing Fisher..."
  $FISH_PATH -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
fi

info "Updating Fisher plugins..."
$FISH_PATH -c "fisher update"

# --- Step 8: tpm ---
if [ -d "$TPM_DIR" ]; then
  skip "tpm"
else
  info "Installing tpm..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

# --- Step 9: NeoVim config ---
if [ -d "$NVIM_DIR" ]; then
  skip "NeoVim config"
else
  info "Cloning NeoVim config..."
  git clone https://github.com/jsvensson/nvim.git "$NVIM_DIR"
fi

# --- Step 10: Summary ---
echo ""
echo "=== Bootstrap complete! ==="
echo ""
warn "Manual steps remaining:"
echo "  1. Install and set up 1Password"
echo "     - Enable SSH agent in 1Password settings"
echo "     - This enables git commit signing and SSH auth"
echo "  2. Open tmux and press prefix+I (Ctrl-A I) to install plugins"
echo "  3. Open NeoVim to let lazy.nvim install plugins"
echo ""
