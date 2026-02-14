# Cheatsheets Reference

Human-readable reference for all cheatsheets in this repository.

---

## Claude Code

Anthropic's agentic coding assistant that lives in your terminal.

**Install:** `npm install -g @anthropic-ai/claude-code`

### Getting Started

| Command | Description |
|---------|-------------|
| `claude` | Start an interactive REPL session |
| `claude "prompt"` | Start REPL with an initial prompt |
| `claude -p "prompt"` | One-shot: print response and exit (non-interactive/headless) |
| `cat file \| claude -p "prompt"` | Pipe file content into Claude for analysis |
| `claude -c` | Continue the most recent conversation in the current directory |
| `claude -c -p "prompt"` | Continue the most recent conversation in non-interactive mode |
| `claude -r "session" "prompt"` | Resume a specific session by ID or name |
| `claude update` | Update Claude Code to the latest version |
| `claude doctor` | Diagnose CLI configuration and installation issues |
| `claude mcp` | Manage Model Context Protocol (MCP) server connections |

### CLI Flags

| Flag | Description |
|------|-------------|
| `--print, -p` | Print response and exit without interactive mode |
| `--continue, -c` | Continue the most recent conversation |
| `--resume, -r SESSION` | Resume a specific previous session |
| `--model MODEL` | Select the model to use (e.g. opus, sonnet, haiku) |
| `--fallback-model MODEL` | Automatically fall back to this model if the primary is unavailable |
| `--add-dir PATHS` | Add additional working directories for context |
| `--allowedTools TOOLS` | Restrict available tools to the listed set. Example: `--allowedTools "Bash(git log *)" "Edit"` |
| `--disallowedTools TOOLS` | Block specific tools from being used |
| `--append-system-prompt TEXT` | Append custom instructions to the system prompt |
| `--append-system-prompt-file FILE` | Load additional system prompt instructions from a file |
| `--agent AGENT` | Use a specific named agent profile |
| `--agents JSON` | Define subagents for multi-step tasks via JSON config |
| `--headless` | Run in print-only non-interactive mode |
| `--timeout MS` | Set maximum execution time in milliseconds (headless mode) |
| `--max-budget-usd AMOUNT` | Cap the maximum cost for the session in USD |
| `--debug [CATEGORIES]` | Enable debug mode, optionally filtered by category. Example: `claude --debug "api,mcp"` |
| `--chrome` | Enable Chrome browser automation |
| `--allow-dangerously-skip-permissions` | Enable the ability to bypass permission prompts (use with caution) |
| `--dangerously-skip-permissions` | Skip all permission prompts entirely |
| `--version` | Show version information |
| `--help` | Show help message |

### Slash Commands

| Command | Description |
|---------|-------------|
| `/help` | List all available slash commands and usage |
| `/clear` | Clear the current conversation context |
| `/compact` | Summarize and compress the current session to save context |
| `/config` | Open the project configuration editor |
| `/context` | Show current context window usage |
| `/copy` | Copy the last response to the clipboard |
| `/cost` | Show token usage and cost statistics for the session |
| `/doctor` | Diagnose Claude Code configuration issues |
| `/exit` | Exit the interactive session |
| `/export` | Export the conversation to a file or clipboard |
| `/init` | Create an initial CLAUDE.md project memory file |
| `/keybindings` | Customize keyboard shortcuts |
| `/mcp` | Manage MCP server connections within the session |
| `/memory` | Edit the CLAUDE.md memory file |
| `/model` | Switch between available AI models |
| `/permissions` | View and update tool permissions |
| `/plan` | Enter plan mode to outline steps before execution |
| `/rename` | Rename the current session |
| `/resume` | Resume a specific previous session |
| `/tools` | Manage available tools for the current session |

### Keyboard Shortcuts

| Shortcut | Description |
|----------|-------------|
| `CMD+T` | Toggle extended thinking mode (macOS) |
| `CMD+P` | Open the model picker (macOS) |
| `CTRL+G` | Open input in an external editor |
| `SHIFT+TAB` | Toggle between permission modes |

### Notes

- For official documentation, see [Claude Code Docs](https://docs.anthropic.com/en/docs/claude-code)
- CLI reference: [code.claude.com/docs/en/cli-reference](https://code.claude.com/docs/en/cli-reference)
- Always run `claude` from your project root for best context
- Create a CLAUDE.md file with `/init` to persist project-specific instructions

---

## Codex CLI

OpenAI's terminal-based AI coding agent.

**Install:** `npm install -g @openai/codex`

### Getting Started

| Command | Description |
|---------|-------------|
| `codex` | Launch the terminal UI (interactive session) |
| `codex "prompt"` | Launch with an initial instruction |
| `codex help` | Show help and command reference |
| `codex resume` | Resume the most recent session in the current directory |
| `codex app` | Open the Codex desktop app (macOS) |
| `codex exec` | Execute shell or script commands suggested by Codex |
| `codex --version` | Show version information |

### CLI Flags

| Flag | Description |
|------|-------------|
| `--model, -m MODEL` | Select the model to use. Example: `codex -m gpt-5-codex` or `codex -m o4-mini` |
| `--ask-for-approval, -a MODE` | Control when Codex pauses for human approval. Modes: `untrusted`, `on-failure`, `on-request`, `never` |
| `--sandbox, -s MODE` | Set the sandbox policy for file access. Modes: `read-only`, `workspace-write`, `danger-full-access` |
| `--full-auto` | Shorthand for `--ask-for-approval on-request --sandbox workspace-write` |
| `--dangerously-bypass-approvals-and-sandbox` | Run with no sandbox or approval prompts (alias: `--yolo`) |
| `--yolo` | Alias for `--dangerously-bypass-approvals-and-sandbox` |
| `--add-dir PATH` | Add directories for write access (repeatable for multiple paths) |
| `--cd, -C PATH` | Set the working directory before running |
| `--image, -i PATH` | Attach image(s) to the prompt for multimodal input. Example: `codex --image diagram.png "implement this"` |
| `--config, -c KEY=VALUE` | Override a configuration value (JSON or string) |
| `--profile, -p PROFILE` | Use a named profile from `~/.codex/config.toml` |
| `--search` | Enable live web search during the session |
| `--oss` | Use a local open-source model provider (requires Ollama) |
| `--enable FEATURE` | Enable a feature flag |
| `--disable FEATURE` | Disable a feature flag |
| `--no-alt-screen` | Disable alternate screen mode in the terminal UI |
| `--help` | Show help message |

### Sandbox Modes

| Mode | Description |
|------|-------------|
| `read-only` | Agent can only read files, no modifications allowed |
| `workspace-write` | Agent can write within the project directory only |
| `danger-full-access` | Full read/write access to the entire filesystem (use with extreme caution) |

### Approval Modes

| Mode | Description |
|------|-------------|
| `untrusted` | Prompt for approval on every action (most restrictive) |
| `on-failure` | Only prompt for approval when a command fails |
| `on-request` | Only prompt when the agent explicitly requests approval |
| `never` | Never prompt for approval (fully autonomous) |

### Common Workflows

| Command | Description |
|---------|-------------|
| `codex "explain what this project does"` | Understand an unfamiliar codebase |
| `codex --sandbox workspace-write -a on-request "add pagination"` | Implement a feature with safe file writes |
| `codex --yolo "run all tests and fix failures"` | Fully autonomous test-and-fix loop (dangerous) |
| `codex -m gpt-5-codex --search "migrate the database schema"` | Use a specific model with web search enabled |
| `codex --image wireframe.png "build this UI"` | Generate code from a visual wireframe |
| `codex --profile dev "refactor auth module"` | Use a saved configuration profile |

### Configuration

| Item | Description |
|------|-------------|
| `~/.codex/config.toml` | Global configuration file location |
| `[profile.NAME]` | Define named profiles in config.toml for different workflows |
| `codex -c key=value` | Override any config value from the command line |

### Notes

- Official documentation: [developers.openai.com/codex/cli/reference](https://developers.openai.com/codex/cli/reference)
- Code runs locally — nothing leaves your machine unless explicitly shared
- Use `--sandbox workspace-write` as a safe default for most tasks
- Profiles in `~/.codex/config.toml` help standardize team workflows

---

## My Claude Skills

Custom slash command skills for Claude Code, stored in `~/.claude/skills/`.

Each skill extends Claude Code with domain-specific workflows and automation.

### Session Management

| Command | Description |
|---------|-------------|
| `/catchup` | Orient agent with project context before taking instructions. Queries OpenMemory for handoffs, scans git state, reads CLAUDE.md, checks TaskList. Presents a briefing then waits for instructions. |
| `/handoff` | Capture session state for resumption. Generates structured handoff prompt with completed work, outstanding tasks, next steps, blockers. Stores in OpenMemory with `handoff` tag. |
| `/refocus` | Get back on track after interruption. Checks TaskList state, reads plan file, re-states next action, then immediately resumes work. |

### Memory and Persistence

| Command | Description |
|---------|-------------|
| `/remember` | Store session knowledge to OpenMemory. Reviews conversation for decisions, bugs fixed, discoveries, preferences. Stores as 200-400 token topic briefs with project tags. |
| `/om-save-insight` | Persist technical insights and gotchas. Captures non-obvious learnings, tool quirks, architecture patterns. Tags with `discovery` for future retrieval. |
| `/commit-and-update` | Commit, push, and save memories. Full workflow: git commit with trailers, push to origin, update docs if needed, store memories, write Matrix notification summary. |

### Task Management

| Command | Description |
|---------|-------------|
| `/sync-tasks` | Audit and sync TaskList with project state. Removes stale tasks, marks completed work, adds missing tasks from conversation/TODOs/handoffs. Sets dependencies. |

### Documentation

| Command | Description |
|---------|-------------|
| `/update-config-doc` | Regenerate Claude Code architecture doc. Spawns `claude-config-documenter` agent to scan all skills, agents, hooks, and config files. Updates docs/claude-code-architecture.md. |

### Notes

- Skills are stored in `~/.claude/skills/<name>/SKILL.md`
- Each skill has YAML frontmatter with name, description, and user-invocable flag
- Invoke with `/<skill-name>` or `/<skill-name> <arguments>`
- Arguments are available as `$ARGUMENTS` in the skill template

---

## My Claude Agents

Custom subagents for Claude Code, stored in `~/.claude/agents/`.

Agents are spawned via the Task tool for specialised autonomous work.

### Infrastructure

| Agent | Description |
|-------|-------------|
| `proxmox-auditor` | Audit Proxmox cluster, VMs, LXCs, storage. Comprehensive inventory of virtualisation infrastructure. Outputs structured data. |
| `network-auditor` | Document VLANs, DNS, DHCP, firewall rules. Maps network topology and configuration. Use when planning changes. |
| `backup-verifier` | Verify backup freshness and integrity. Checks backup jobs, retention, and recoverability. Run before destructive operations. |
| `storage-auditor` | Inventory drives, ZFS pools, storage health. Comprehensive storage audit across Proxmox nodes. |
| `ssh-executor` | Execute commands on remote hosts. Fast remote command execution using Haiku model. Use for any SSH operations. |

### Homelab

| Agent | Description |
|-------|-------------|
| `home-assistant-auditor` | Audit Home Assistant config and integrations. Documents current HA state including automations and add-ons. |
| `config-migrator` | Generate migration configs and scripts. Prepares configs for new environments (e.g., Proxmox upgrades). |

### Legal

| Agent | Description |
|-------|-------------|
| `affidavit-drafting` | Draft affidavit sections in FCFCoA form. Produces court-ready paragraphs, revises sections, expands content within word limits. |
| `legal-research` | Find authorities, legislation, practice directions. Case law research, statutory interpretation, procedural requirements. |
| `evidence-extraction` | Mine factual record for admissible evidence. Identifies evidence for issues, cross-references claims, recommends annexures. |
| `quality-compliance` | Review for legal and procedural compliance. Checks admissibility, procedural requirements, internal consistency, word limits. |
| `document-assembly` | Produce court-ready filing documents. Assembles final documents, formats annexures, prepares filing bundles. |
| `barrister` | Strategic legal advice and case analysis. Assesses argument strength, identifies vulnerabilities, anticipates opposing response. |
| `data-analysis` | Process structured data for evidence. GPS analysis, email patterns, timeline construction, quantitative extraction. |

### Academic

| Agent | Description |
|-------|-------------|
| `assignment-reviewer` | HD-standard feedback on legal assignments. Legal accuracy checks, AGLC4 compliance, professional critique. |
| `study-guide-generator` | Generate weekly study notes from materials. Comprehensive notes with exam likelihood indicators. |
| `case-irac-analyser` | Analyse cases in IRAC format. Ratio extraction, related authorities, exam-ready summaries. |
| `citation-compliance` | Verify AGLC4 citation compliance. Checks refs.bib, validates pinpoint references. |
| `authority-fetcher` | Fetch authorities from AustLII. Extracts full text, creates IRAC summaries for case law collections. |
| `flashcard-generator` | Generate Anki flashcards from materials. Spaced repetition cards for legal concepts, cases, statutes. |

### General

| Agent | Description |
|-------|-------------|
| `doc-reviewer` | Review documentation quality. Checks consistency, formatting, completeness, cross-references. |
| `claude-config-documenter` | Document Claude Code architecture. Scans skills, agents, hooks. Generates Mermaid diagrams. |

### Notes

- Agents are stored in `~/.claude/agents/<category>/<name>.md`
- Spawn via Task tool: `Task(subagent_type="agent-name", prompt="...")`
- Agents run autonomously and return results to the main conversation
- Each agent has specific tools available based on its purpose
