####
#### Autocompletion Setup
####
# Load completions for external tools

# 1Password CLI completions
if type -q op
    op completion fish | source
end
