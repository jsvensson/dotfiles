# With inspiration from https://polothy.github.io/post/2019-08-19-fzf-git-checkout/
function fzf-git-checkout -d "Change git branch"
	if not git rev-parse HEAD > /dev/null 2>&1
		echo "Not in a git repository"
		return
	end

	set -l pr_win 'nowrap'
	set -l preview "git log -n 50 \
		--color=always --date=short \
		--pretty='format:%C(auto)%cd %h%d %s' \
		(echo '{}' | sed 's/.* //') --"
	set -l branch (
		git --no-pager branch --all | \
		grep -v origin/HEAD | \
		fzf --nth=1,2 +m --preview-window $pr_win --preview $preview
	)

	if not set -q branch[1]
		commandline -f repaint
		return
	end

	set branch (echo $branch | awk '{print $1}' | sed "s/.* //")

	if string match --quiet -r 'remotes/' $branch
		git checkout --track $branch
	else
		git checkout $branch
	end

	# TODO: Figure out how to redraw prompt without losing git output
	#commandline -f repaint
end

