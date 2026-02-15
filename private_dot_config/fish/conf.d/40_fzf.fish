####
#### FZF Configuration
####
# Fuzzy finder options and styling

set -gx FZF_DEFAULT_OPTS "
	--color=fg:#CBCCC6,bg:#1F2430,hl:#5CCFE6
	--color=fg+:#CBCCC6,bg+:#28303B,hl+:#5CCFE6
	--color=border:#3A444C,header:#D4BFFF,gutter:#1F2430
	--color=spinner:#FFA759,info:#95E6CB,separator:#3A444C
	--color=pointer:#FFB378,marker:#FFCC66,prompt:#CBCCC6
	--cycle --layout=reverse-list --border
	--height=80% --preview-window=wrap,70% --marker='@' --pointer='@'"

# Gum configuration (interactive command-line prompt tool)
set -gx GUM_FILTER_INDICATOR "❯"
