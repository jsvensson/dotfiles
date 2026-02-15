####
#### PATH Management
####
# Add user and language-specific directories to PATH

# Custom path directories (space-separated)
set -l custom_paths ~/.local/bin ~/go/bin ~/.cargo/bin

# Add each directory to PATH if it exists
for dir in $custom_paths
    test -d $dir && set -gx -a PATH $dir
end

# Homebrew environment setup
eval (/opt/homebrew/bin/brew shellenv)
