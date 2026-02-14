cheatsheet do
    title 'Claude Code'
    docset_file_name 'Claude_Code'
    keyword 'claude'
    source_url 'http://cheat.kapeli.com'

    introduction <<-'END'
    Cheat sheet for Claude Code, Anthropic's agentic coding assistant that lives in your terminal.

    Install via npm:

    ```bash
    npm install -g @anthropic-ai/claude-code
    ```
END

    category do
        id 'Getting Started'
        entry do
            command 'claude'
            name 'Start an interactive REPL session'
        end
        entry do
            command 'claude "prompt"'
            name 'Start REPL with an initial prompt'
        end
        entry do
            command 'claude -p "prompt"'
            name 'One-shot: print response and exit (non-interactive/headless)'
        end
        entry do
            command 'cat file | claude -p "prompt"'
            name 'Pipe file content into Claude for analysis'
        end
        entry do
            command 'claude -c'
            name 'Continue the most recent conversation in the current directory'
        end
        entry do
            command 'claude -c -p "prompt"'
            name 'Continue the most recent conversation in non-interactive mode'
        end
        entry do
            command 'claude -r "session" "prompt"'
            name 'Resume a specific session by ID or name'
        end
        entry do
            command 'claude update'
            name 'Update Claude Code to the latest version'
        end
        entry do
            command 'claude doctor'
            name 'Diagnose CLI configuration and installation issues'
        end
        entry do
            command 'claude mcp'
            name 'Manage Model Context Protocol (MCP) server connections'
        end
    end

    category do
        id 'CLI Flags'
        entry do
            command '--print, -p'
            name 'Print response and exit without interactive mode'
        end
        entry do
            command '--continue, -c'
            name 'Continue the most recent conversation'
        end
        entry do
            command '--resume, -r SESSION'
            name 'Resume a specific previous session'
        end
        entry do
            command '--model MODEL'
            name 'Select the model to use (e.g. opus, sonnet, haiku)'
        end
        entry do
            command '--fallback-model MODEL'
            name 'Automatically fall back to this model if the primary is unavailable'
        end
        entry do
            command '--add-dir PATHS'
            name 'Add additional working directories for context'
        end
        entry do
            command '--allowedTools TOOLS'
            name 'Restrict available tools to the listed set'
            notes 'Example: `--allowedTools "Bash(git log *)" "Edit"`'
        end
        entry do
            command '--disallowedTools TOOLS'
            name 'Block specific tools from being used'
        end
        entry do
            command '--append-system-prompt TEXT'
            name 'Append custom instructions to the system prompt'
        end
        entry do
            command '--append-system-prompt-file FILE'
            name 'Load additional system prompt instructions from a file'
        end
        entry do
            command '--agent AGENT'
            name 'Use a specific named agent profile'
        end
        entry do
            command '--agents JSON'
            name 'Define subagents for multi-step tasks via JSON config'
        end
        entry do
            command '--headless'
            name 'Run in print-only non-interactive mode'
        end
        entry do
            command '--timeout MS'
            name 'Set maximum execution time in milliseconds (headless mode)'
        end
        entry do
            command '--max-budget-usd AMOUNT'
            name 'Cap the maximum cost for the session in USD'
        end
        entry do
            command '--debug [CATEGORIES]'
            name 'Enable debug mode, optionally filtered by category'
            notes 'Example: `claude --debug "api,mcp"`'
        end
        entry do
            command '--chrome'
            name 'Enable Chrome browser automation'
        end
        entry do
            command '--allow-dangerously-skip-permissions'
            name 'Enable the ability to bypass permission prompts (use with caution)'
        end
        entry do
            command '--dangerously-skip-permissions'
            name 'Skip all permission prompts entirely'
        end
        entry do
            command '--version'
            name 'Show version information'
        end
        entry do
            command '--help'
            name 'Show help message'
        end
    end

    category do
        id 'Slash Commands'
        entry do
            command '/help'
            name 'List all available slash commands and usage'
        end
        entry do
            command '/clear'
            name 'Clear the current conversation context'
        end
        entry do
            command '/compact'
            name 'Summarize and compress the current session to save context'
        end
        entry do
            command '/config'
            name 'Open the project configuration editor'
        end
        entry do
            command '/context'
            name 'Show current context window usage'
        end
        entry do
            command '/copy'
            name 'Copy the last response to the clipboard'
        end
        entry do
            command '/cost'
            name 'Show token usage and cost statistics for the session'
        end
        entry do
            command '/doctor'
            name 'Diagnose Claude Code configuration issues'
        end
        entry do
            command '/exit'
            name 'Exit the interactive session'
        end
        entry do
            command '/export'
            name 'Export the conversation to a file or clipboard'
        end
        entry do
            command '/init'
            name 'Create an initial CLAUDE.md project memory file'
        end
        entry do
            command '/keybindings'
            name 'Customize keyboard shortcuts'
        end
        entry do
            command '/mcp'
            name 'Manage MCP server connections within the session'
        end
        entry do
            command '/memory'
            name 'Edit the CLAUDE.md memory file'
        end
        entry do
            command '/model'
            name 'Switch between available AI models'
        end
        entry do
            command '/permissions'
            name 'View and update tool permissions'
        end
        entry do
            command '/plan'
            name 'Enter plan mode to outline steps before execution'
        end
        entry do
            command '/rename'
            name 'Rename the current session'
        end
        entry do
            command '/resume'
            name 'Resume a specific previous session'
        end
        entry do
            command '/tools'
            name 'Manage available tools for the current session'
        end
    end

    category do
        id 'Keyboard Shortcuts'
        entry do
            command 'CMD+T'
            name 'Toggle extended thinking mode (macOS)'
        end
        entry do
            command 'CMD+P'
            name 'Open the model picker (macOS)'
        end
        entry do
            command 'CTRL+G'
            name 'Open input in an external editor'
        end
        entry do
            command 'SHIFT+TAB'
            name 'Toggle between permission modes'
        end
    end

    notes <<-'END'
        * For official documentation, see [Claude Code Docs](https://docs.anthropic.com/en/docs/claude-code)
        * CLI reference: [code.claude.com/docs/en/cli-reference](https://code.claude.com/docs/en/cli-reference)
        * Always run `claude` from your project root for best context
        * Create a CLAUDE.md file with `/init` to persist project-specific instructions
    END

end