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
- When creating PRs with `gh pr`, use `--title "..."` to pass the PR title.
- When creating PRs with `but pr new`, pass the title with `-m "..."`; the CLI rejects `-F`.
  Set the body afterwards with `gh pr edit <N> --body-file <file>`.
- Never rewrite history (rebase, amend, squash, force-push) on a branch that
  has an upstream or an open pull request. Review comments, CI results, and
  other tooling anchor to commits; rewriting the branch orphans that context
  and destroys the incremental "what changed since last review" diff.
  - Address review feedback with new commits, prefixed `review:` so the
    feedback-to-fix mapping stays scannable in the log.
  - Rewriting is fine on branches that are local-only with no open PR.
    History nobody has consumed is free to change.
  - Any other case requires an explicit request from the user.
    When unsure whether a branch qualifies, ask first.
