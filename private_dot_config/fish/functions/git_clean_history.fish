function git_clean_history -d "Clean up Git history"
  set -f prefixes \
    "git commit" \
    "git branch" \
    "git clone" \
    "git checkout"

  for p in $prefixes
    echo $p
    history delete --prefix $p
  end
end
