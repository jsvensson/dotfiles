# Fix shift+arrow keys in tmux
#bind \e\[1\;2A backward-word # shift-up
#bind \e\[1\;2B backward-word # shift-down
bind \e\[1\;2D backward-word # shift-left
bind \e\[1\;2C forward-word # shift-right

# Ctrl-D: fzf, list directories recursively under pwd
bind \cd fzf_change_directory

# Ctrl-G G: Navigate to git repository
bind \cg\cg git-repo

# Ctrl-G B: check out git branch
bind \cg\cb fzf-git-checkout
