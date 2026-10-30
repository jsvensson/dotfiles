####
#### Editor and Development Environment
####
# Configure default editor, git, and SSH settings

# Default editor for commands like `git commit`, `crontab -e`, etc.
set -gx EDITOR nvim

# SSH agent socket (1Password Agent)
set -gx SSH_AUTH_SOCK ~/.1password/agent.sock

# Character encoding
set -gx LC_CTYPE UTF-8
