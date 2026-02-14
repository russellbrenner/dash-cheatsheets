# Dash Cheatsheets

Cheatsheets for [Dash](https://kapeli.com/dash) (macOS) and [Zeal](https://zealdocs.org/) (cross-platform) covering AI coding assistants and custom Claude Code configurations.

## Included Cheatsheets

| Cheatsheet | Keyword | Description |
|------------|---------|-------------|
| **Claude Code** | `claude` | Anthropic's agentic coding CLI — flags, slash commands, keyboard shortcuts |
| **Codex CLI** | `codex` | OpenAI's terminal AI agent — sandbox modes, approval modes, workflows |
| **My Claude Skills** | `skill` | Custom slash commands for session management, memory, task tracking |
| **My Claude Agents** | `agent` | Custom subagents for infrastructure, legal, academic, and homelab tasks |

## Quick Start

### Prerequisites

- [Docker](https://www.docker.com/) (for building docsets)
- [Dash](https://kapeli.com/dash) or [Zeal](https://zealdocs.org/) (for viewing)

### Build and Install

```bash
# Clone the repository
git clone https://github.com/russellbrenner/dash-cheatsheets.git
cd dash-cheatsheets

# Build all docsets
./build.sh

# Install to Dash (macOS)
cp -r *.docset ~/Library/Application\ Support/Dash/Cheat\ Sheets/

# Install to Zeal (Linux/Windows)
cp -r *.docset ~/.local/share/Zeal/Zeal/docsets/
```

Then restart Dash/Zeal or rescan cheatsheets from Preferences.

## Usage in Dash

Search using the keyword prefix:

- `claude:flags` — Find CLI flags for Claude Code
- `codex:sandbox` — Find sandbox mode documentation
- `skill:handoff` — Find the /handoff skill
- `agent:proxmox` — Find the proxmox-auditor agent

## Cheatsheet Details

### Claude Code

Reference for [Claude Code](https://docs.anthropic.com/en/docs/claude-code), Anthropic's CLI coding assistant.

**Categories:**
- Getting Started — `claude`, `claude -p`, `claude -c`, `claude update`
- CLI Flags — `--model`, `--allowedTools`, `--debug`, `--max-budget-usd`
- Slash Commands — `/help`, `/compact`, `/plan`, `/memory`, `/export`
- Keyboard Shortcuts — `CMD+T` (thinking), `CMD+P` (model picker)

### Codex CLI

Reference for [Codex CLI](https://openai.com/index/introducing-codex/), OpenAI's terminal AI agent.

**Categories:**
- Getting Started — `codex`, `codex resume`, `codex exec`
- CLI Flags — `--model`, `--sandbox`, `--ask-for-approval`, `--yolo`
- Sandbox Modes — `read-only`, `workspace-write`, `danger-full-access`
- Approval Modes — `untrusted`, `on-failure`, `on-request`, `never`
- Common Workflows — Feature implementation, autonomous testing, multimodal input

### My Claude Skills

Custom slash commands stored in `~/.claude/skills/`.

**Categories:**
- Session Management — `/catchup`, `/handoff`, `/refocus`
- Memory and Persistence — `/remember`, `/om-save-insight`, `/commit-and-update`
- Task Management — `/sync-tasks`
- Documentation — `/update-config-doc`

### My Claude Agents

Custom subagents stored in `~/.claude/agents/`.

**Categories:**
- Infrastructure — `proxmox-auditor`, `network-auditor`, `backup-verifier`, `ssh-executor`
- Homelab — `home-assistant-auditor`, `config-migrator`
- Legal — `affidavit-drafting`, `legal-research`, `evidence-extraction`, `barrister`
- Academic — `assignment-reviewer`, `case-irac-analyser`, `flashcard-generator`

## Creating New Cheatsheets

See [docs/BUILDING.md](docs/BUILDING.md) for the full DSL reference and examples.

Quick example:

```ruby
cheatsheet do
    title 'My Tool'
    docset_file_name 'My_Tool'
    keyword 'mytool'
    source_url 'http://cheat.kapeli.com'

    introduction <<-'END'
    Brief description of the tool.
    END

    category do
        id 'Commands'
        entry do
            command 'mytool run'
            name 'Run the tool'
            notes 'Optional extended explanation'
        end
    end

    notes <<-'END'
        * Footer notes and links
    END
end
```

## Contributing

### To This Repository

1. Create a new `cheatsheets_*.rb` file
2. Run `./build.sh` to verify it builds
3. Submit a pull request

### To Kapeli (Upstream)

The Claude Code and Codex CLI cheatsheets can be contributed to the official Kapeli repository:

1. Fork [Kapeli/cheatsheets](https://github.com/Kapeli/cheatsheets)
2. Copy `cheatsheets_Claude_Code_Version2.rb` to `cheatsheets/Claude_Code.rb`
3. Copy `cheatsheets_Codex_CLI_Version2.rb` to `cheatsheets/Codex_CLI.rb`
4. Open a pull request

## License

These cheatsheets are provided for personal use. The cheatsheet format and tooling are from [Kapeli](https://kapeli.com/).
