cheatsheet do
    title 'Codex CLI'
    docset_file_name 'Codex_CLI'
    keyword 'codex'
    source_url 'http://cheat.kapeli.com'

    introduction <<-'END'
    Cheat sheet for OpenAI Codex CLI, a terminal-based AI coding agent.

    Install via npm:

    ```bash
    npm install -g @openai/codex
    ```
END

    category do
        id 'Getting Started'
        entry do
            command 'codex'
            name 'Launch the terminal UI (interactive session)'
        end
        entry do
            command 'codex "prompt"'
            name 'Launch with an initial instruction'
        end
        entry do
            command 'codex help'
            name 'Show help and command reference'
        end
        entry do
            command 'codex resume'
            name 'Resume the most recent session in the current directory'
        end
        entry do
            command 'codex app'
            name 'Open the Codex desktop app (macOS)'
        end
        entry do
            command 'codex exec'
            name 'Execute shell or script commands suggested by Codex'
        end
        entry do
            command 'codex --version'
            name 'Show version information'
        end
    end

    category do
        id 'CLI Flags'
        entry do
            command '--model, -m MODEL'
            name 'Select the model to use'
            notes 'Example: `codex -m gpt-5-codex` or `codex -m o4-mini`'
        end
        entry do
            command '--ask-for-approval, -a MODE'
            name 'Control when Codex pauses for human approval'
            notes 'Modes: `untrusted`, `on-failure`, `on-request`, `never`'
        end
        entry do
            command '--sandbox, -s MODE'
            name 'Set the sandbox policy for file access'
            notes 'Modes: `read-only`, `workspace-write`, `danger-full-access`'
        end
        entry do
            command '--full-auto'
            name 'Shorthand for `--ask-for-approval on-request --sandbox workspace-write`'
        end
        entry do
            command '--dangerously-bypass-approvals-and-sandbox'
            name 'Run with no sandbox or approval prompts (alias: `--yolo`)'
        end
        entry do
            command '--yolo'
            name 'Alias for `--dangerously-bypass-approvals-and-sandbox`'
        end
        entry do
            command '--add-dir PATH'
            name 'Add directories for write access (repeatable for multiple paths)'
        end
        entry do
            command '--cd, -C PATH'
            name 'Set the working directory before running'
        end
        entry do
            command '--image, -i PATH'
            name 'Attach image(s) to the prompt for multimodal input'
            notes 'Example: `codex --image diagram.png "implement this"`'
        end
        entry do
            command '--config, -c KEY=VALUE'
            name 'Override a configuration value (JSON or string)'
        end
        entry do
            command '--profile, -p PROFILE'
            name 'Use a named profile from `~/.codex/config.toml`'
        end
        entry do
            command '--search'
            name 'Enable live web search during the session'
        end
        entry do
            command '--oss'
            name 'Use a local open-source model provider (requires Ollama)'
        end
        entry do
            command '--enable FEATURE'
            name 'Enable a feature flag'
        end
        entry do
            command '--disable FEATURE'
            name 'Disable a feature flag'
        end
        entry do
            command '--no-alt-screen'
            name 'Disable alternate screen mode in the terminal UI'
        end
        entry do
            command '--help'
            name 'Show help message'
        end
    end

    category do
        id 'Sandbox Modes'
        entry do
            command 'read-only'
            name 'Agent can only read files, no modifications allowed'
        end
        entry do
            command 'workspace-write'
            name 'Agent can write within the project directory only'
        end
        entry do
            command 'danger-full-access'
            name 'Full read/write access to the entire filesystem (use with extreme caution)'
        end
    end

    category do
        id 'Approval Modes'
        entry do
            command 'untrusted'
            name 'Prompt for approval on every action (most restrictive)'
        end
        entry do
            command 'on-failure'
            name 'Only prompt for approval when a command fails'
        end
        entry do
            command 'on-request'
            name 'Only prompt when the agent explicitly requests approval'
        end
        entry do
            command 'never'
            name 'Never prompt for approval (fully autonomous)'
        end
    end

    category do
        id 'Common Workflows'
        entry do
            command 'codex "explain what this project does"'
            name 'Understand an unfamiliar codebase'
        end
        entry do
            command 'codex --sandbox workspace-write -a on-request "add pagination"'
            name 'Implement a feature with safe file writes'
        end
        entry do
            command 'codex --yolo "run all tests and fix failures"'
            name 'Fully autonomous test-and-fix loop (dangerous)'
        end
        entry do
            command 'codex -m gpt-5-codex --search "migrate the database schema"'
            name 'Use a specific model with web search enabled'
        end
        entry do
            command 'codex --image wireframe.png "build this UI"'
            name 'Generate code from a visual wireframe'
        end
        entry do
            command 'codex --profile dev "refactor auth module"'
            name 'Use a saved configuration profile'
        end
    end

    category do
        id 'Configuration'
        entry do
            command '~/.codex/config.toml'
            name 'Global configuration file location'
        end
        entry do
            command '[profile.NAME]'
            name 'Define named profiles in config.toml for different workflows'
        end
        entry do
            command 'codex -c key=value'
            name 'Override any config value from the command line'
        end
    end

    notes <<-'END'
        * Official documentation: [developers.openai.com/codex/cli/reference](https://developers.openai.com/codex/cli/reference)
        * Code runs locally — nothing leaves your machine unless explicitly shared
        * Use `--sandbox workspace-write` as a safe default for most tasks
        * Profiles in `~/.codex/config.toml` help standardize team workflows
    END

end