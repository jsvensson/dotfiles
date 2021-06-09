# With inspiration from https://polothy.github.io/post/2019-08-19-fzf-git-checkout/
function fzf_change_git_branch -d "Change git branch"
	if not git rev-parse HEAD > /dev/null 2>&1
		echo "Not in a git repository"
		return
	end

	set -l preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s"'
	set -l branch (git --no-pager branch -vv | fzf +m --preview $preview)
	if not set -q var[1]
		return
	end

	git checkout (echo $branch | awk '{print $1}' | sed "s/.* //")
end

