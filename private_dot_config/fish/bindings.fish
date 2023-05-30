# Fix shift+arrow keys in tmux
#bind \e\[1\;2A backward-word # shift-up
#bind \e\[1\;2B backward-word # shift-down
bind \e\[1\;2D backward-word # shift-left
bind \e\[1\;2C forward-word # shift-right

# Ctrl-D: fzf, list directories recursively under pwd
bind \cd fzf_change_directory

# Ctrl-G G: cd to git repository
bind \cg\cg fzf_ghq_go_to_repository

# Ctrl-G B: check out git branch
bind \cg\cb fzf-git-checkout
