#!/usr/bin/env bash

# Setup file to do some initial installation. Requires the brewfile
# to be applied first so that all tools are available.

# Install tpm for tmux
TPM_DIR="$HOME/.config/tmux/plugins/tpm"

if [[ -d $TPM_DIR ]]; then
  echo "tmux: tpm already installed in $TPM_DIR"
else
  echo "tmux: installing tpm"
  git clone https://github.com/tmux-plugins/tpm $TPM_DIR
fi

