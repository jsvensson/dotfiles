function fzf_ghq_go_to_repository -d 'Go to repository'
	set -l query (commandline -b)
	[ -n query ]; and set flags --query="$query"; or set flags
	ghq list | fzf $flags | read select
	[ -n "$select" ]; and builtin cd (ghq root)/$select
	commandline -f repaint
end
