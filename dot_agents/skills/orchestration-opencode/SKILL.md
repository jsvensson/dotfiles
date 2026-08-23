---
name: orchestration-opencode
description: Use OpenCode (with Kimi Code or other providers) inside Orca's supervised multi-agent orchestration. Covers the headless `opencode run --auto` pattern, since OpenCode's TUI does not accept Orca's dispatch --inject lifecycle preamble.
---

# OpenCode + Orca Orchestration

Use this skill when you want to supervise an OpenCode worker through Orca orchestration: create a Task, dispatch it, wait for `worker_done`, and optionally coordinate multiple workers or ask/reply flows.

For general orchestration concepts (Runs, Tasks, Dispatches, messaging, worker lifecycle), load the `orchestration` skill first with `orca skills get orchestration`. This skill only covers the OpenCode-specific integration.

## When to use

- You want OpenCode to do work and report `worker_done` so a coordinator can wait on results.
- You want to coordinate multiple OpenCode workers with task dependencies or decision gates.
- You want OpenCode to ask blocking questions and receive replies through Orca.

Do **not** use this skill for simple handoffs. For "go do this, I don't need to track it", use `orca worktree create --agent opencode --prompt "..."` instead.

## Why the standard worker-start path fails

`orca orchestration worker-start --agent opencode` and `orca orchestration dispatch --task <id> --to <terminal> --inject` both rely on injecting a lifecycle preamble into the agent's input. OpenCode's interactive TUI (`opencode` with no subcommand) accepts pasted text but does not auto-submit an injected prompt, so Orca reports:

```
agent_prompt_stalled
```

## The working pattern: `opencode run --auto`

OpenCode has a headless batch mode:

```bash
opencode run --auto "<prompt>"
```

This runs the prompt to completion and exits. By putting the orchestration preamble and the `worker_done` command directly in the prompt, you get a supervised worker.

### Full workflow

```bash
# 1. Create or reuse a Run
orca orchestration run-create --objective "Describe the objective" --json

# 2. Create the Task
orca orchestration task-create --spec "Describe the work" --json

# 3. Create a shell terminal in the target worktree
orca terminal create \
  --worktree id:<full-worktree-id> \
  --title "opencode-worker" \
  --command zsh \
  --json

# 4. Dispatch for tracking only (no --inject)
orca orchestration dispatch \
  --task <task_id> \
  --to <terminal_handle> \
  --json

# 5. Launch headless OpenCode with the orchestrated prompt
orca terminal send \
  --terminal <terminal_handle> \
  --text "opencode run --auto 'You are working on an orchestrated task.\n\nTASK: <task description>\n\n<instructions>\n\nWhen done, you MUST report completion by running this exact shell command:\norca orchestration send --type worker_done --subject \"<short status>\" --body \"<summary>\" --task-id <task_id> --dispatch-id <dispatch_id> --outcome succeeded --files-modified \"<paths>\" --json'" \
  --enter \
  --json

# 6. Wait for completion
orca orchestration check \
  --wait \
  --types worker_done,escalation,question \
  --timeout-ms 900000 \
  --json

# 7. Acknowledge after processing all messages
orca orchestration check --ack <delivery_id> --json

# 8. Release the worker terminal
orca orchestration worker-release --dispatch <dispatch_id> --json
orca terminal close --terminal <terminal_handle> --json
```

### Notes

- Use `--auto` so OpenCode does not pause for permission prompts.
- The prompt must include both `<task_id>` and `<dispatch_id>` so the worker can send a valid `worker_done`.
- If the worker might fail, include `--outcome failed` in the failure path.
- Use `--format json` on `opencode run` only if you want structured events; the default formatted output is fine for terminal reading.

## Model selection

OpenCode supports multiple providers. To force a specific model for the headless run, add:

```bash
opencode run --auto --model kimi-platform/kimi-k2.7-code "..."
```

Use `opencode models` to list available models.

## Ask/reply loops

If the worker needs a blocking answer, instruct it to send a `question`:

```bash
orca orchestration ask --question "<question>" --options "yes,no" --timeout-ms 600000 --json
```

The coordinator replies with:

```bash
orca orchestration reply --id <msg_id> --body "<answer>" --json
```

Include the ask/reply pattern in the worker prompt so it knows when to escalate.

## Cleanup

After a successful `worker_done`:

```bash
orca orchestration worker-release --dispatch <dispatch_id> --json
orca terminal close --terminal <terminal_handle> --json
```

If `worker-release` reports `no_owned_resource` (common for shell terminals), the `terminal close` step still cleans up the PTY.

## Example: verify a file and report back

```bash
orca orchestration task-create --spec "Verify README.md documents WiFi setup" --json
orca terminal create --worktree id:<worktree-id> --command zsh --json
orca orchestration dispatch --task <task_id> --to <terminal> --json
orca terminal send --terminal <terminal> --text "opencode run --auto 'You are working on an orchestrated task. TASK: Verify README.md documents WiFi setup. Read README.md and report whether it contains instructions for copying wifi_config.example.h to wifi_config.h. When done, run: orca orchestration send --type worker_done --subject \"README verification\" --body \"Verified README WiFi setup docs\" --task-id <task_id> --dispatch-id <dispatch_id> --outcome succeeded --json'" --enter --json
orca orchestration check --wait --types worker_done,escalation,question --timeout-ms 300000 --json
```

## Limitations

- OpenCode must be installed and authenticated (`opencode providers list`).
- Each `opencode run` starts a fresh session; it cannot reuse a running TUI session.
- Long tasks cost tokens; set `--timeout-ms` generously and use rolling `check --wait` windows.
