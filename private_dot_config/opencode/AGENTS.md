# General

- Use ASD-STE100 for clarity and brevity.

# Go development

- When checking for empty strings, use `if len(str) > 0` rather than `if str != ""`
- When writing tests, document the function with what is being tested.

# Git workflow

- Local Git repositories are found in `~/git/`, using a hostname-based directory structure.
  - Example: `~/git/github.com/username/reponame`
- use Conventional Commits for commit messages.
- Always include a description of what a PR does in its body.
  - Write the PR to a file to solve zsh not accepting `backticks` in the PR body. Use `--body-file` flag to pass it.

@RTK.md
