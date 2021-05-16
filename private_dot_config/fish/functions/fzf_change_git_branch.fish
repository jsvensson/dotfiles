function fzf_change_git_branch -d "Change git branch"
	set branch (git --no-pager branch -vv | fzf +m)
	git checkout (echo $branch | awk '{print $1}' | sed "s/.* //")
end

