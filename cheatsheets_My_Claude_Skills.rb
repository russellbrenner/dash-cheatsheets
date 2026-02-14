cheatsheet do
    title 'My Claude Skills'
    docset_file_name 'My_Claude_Skills'
    keyword 'skill'
    source_url 'http://cheat.kapeli.com'

    introduction <<-'END'
    Custom slash command skills for Claude Code, stored in `~/.claude/skills/`.

    Each skill extends Claude Code with domain-specific workflows and automation.
END

    category do
        id 'Session Management'
        entry do
            command '/catchup'
            name 'Orient agent with project context before taking instructions'
            notes 'Queries OpenMemory for handoffs, scans git state, reads CLAUDE.md, checks TaskList. Presents a briefing then waits for instructions.'
        end
        entry do
            command '/handoff'
            name 'Capture session state for resumption'
            notes 'Generates structured handoff prompt with completed work, outstanding tasks, next steps, blockers. Stores in OpenMemory with `handoff` tag.'
        end
        entry do
            command '/refocus'
            name 'Get back on track after interruption'
            notes 'Checks TaskList state, reads plan file, re-states next action, then immediately resumes work.'
        end
    end

    category do
        id 'Memory and Persistence'
        entry do
            command '/remember'
            name 'Store session knowledge to OpenMemory'
            notes 'Reviews conversation for decisions, bugs fixed, discoveries, preferences. Stores as 200-400 token topic briefs with project tags.'
        end
        entry do
            command '/om-save-insight'
            name 'Persist technical insights and gotchas'
            notes 'Captures non-obvious learnings, tool quirks, architecture patterns. Tags with `discovery` for future retrieval.'
        end
        entry do
            command '/commit-and-update'
            name 'Commit, push, and save memories'
            notes 'Full workflow: git commit with trailers, push to origin, update docs if needed, store memories, write Matrix notification summary.'
        end
    end

    category do
        id 'Task Management'
        entry do
            command '/sync-tasks'
            name 'Audit and sync TaskList with project state'
            notes 'Removes stale tasks, marks completed work, adds missing tasks from conversation/TODOs/handoffs. Sets dependencies.'
        end
    end

    category do
        id 'Documentation'
        entry do
            command '/update-config-doc'
            name 'Regenerate Claude Code architecture doc'
            notes 'Spawns `claude-config-documenter` agent to scan all skills, agents, hooks, and config files. Updates docs/claude-code-architecture.md.'
        end
    end

    notes <<-'END'
        * Skills are stored in `~/.claude/skills/<name>/SKILL.md`
        * Each skill has YAML frontmatter with name, description, and user-invocable flag
        * Invoke with `/<skill-name>` or `/<skill-name> <arguments>`
        * Arguments are available as `$ARGUMENTS` in the skill template
    END

end
