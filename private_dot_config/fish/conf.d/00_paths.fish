####
#### PATH Management
####
# Add user and language-specific directories to PATH

set -gx -a PATH ~/.local/bin
set -gx -a PATH ~/bin
set -gx -a PATH ~/go/bin
set -gx -a PATH ~/.cargo/bin

# Homebrew environment setup
eval (/opt/homebrew/bin/brew shellenv)
