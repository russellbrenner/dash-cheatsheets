cheatsheet do
    title 'My Claude Agents'
    docset_file_name 'My_Claude_Agents'
    keyword 'agent'
    source_url 'http://cheat.kapeli.com'

    introduction <<-'END'
    Custom subagents for Claude Code, stored in `~/.claude/agents/`.

    Agents are spawned via the Task tool for specialised autonomous work.
END

    category do
        id 'Infrastructure'
        entry do
            command 'proxmox-auditor'
            name 'Audit Proxmox cluster, VMs, LXCs, storage'
            notes 'Comprehensive inventory of virtualisation infrastructure. Outputs structured data.'
        end
        entry do
            command 'network-auditor'
            name 'Document VLANs, DNS, DHCP, firewall rules'
            notes 'Maps network topology and configuration. Use when planning changes.'
        end
        entry do
            command 'backup-verifier'
            name 'Verify backup freshness and integrity'
            notes 'Checks backup jobs, retention, and recoverability. Run before destructive operations.'
        end
        entry do
            command 'storage-auditor'
            name 'Inventory drives, ZFS pools, storage health'
            notes 'Comprehensive storage audit across Proxmox nodes.'
        end
        entry do
            command 'ssh-executor'
            name 'Execute commands on remote hosts'
            notes 'Fast remote command execution using Haiku model. Use for any SSH operations.'
        end
    end

    category do
        id 'Homelab'
        entry do
            command 'home-assistant-auditor'
            name 'Audit Home Assistant config and integrations'
            notes 'Documents current HA state including automations and add-ons.'
        end
        entry do
            command 'config-migrator'
            name 'Generate migration configs and scripts'
            notes 'Prepares configs for new environments (e.g., Proxmox upgrades).'
        end
    end

    category do
        id 'Legal'
        entry do
            command 'affidavit-drafting'
            name 'Draft affidavit sections in FCFCoA form'
            notes 'Produces court-ready paragraphs, revises sections, expands content within word limits.'
        end
        entry do
            command 'legal-research'
            name 'Find authorities, legislation, practice directions'
            notes 'Case law research, statutory interpretation, procedural requirements.'
        end
        entry do
            command 'evidence-extraction'
            name 'Mine factual record for admissible evidence'
            notes 'Identifies evidence for issues, cross-references claims, recommends annexures.'
        end
        entry do
            command 'quality-compliance'
            name 'Review for legal and procedural compliance'
            notes 'Checks admissibility, procedural requirements, internal consistency, word limits.'
        end
        entry do
            command 'document-assembly'
            name 'Produce court-ready filing documents'
            notes 'Assembles final documents, formats annexures, prepares filing bundles.'
        end
        entry do
            command 'barrister'
            name 'Strategic legal advice and case analysis'
            notes 'Assesses argument strength, identifies vulnerabilities, anticipates opposing response.'
        end
        entry do
            command 'data-analysis'
            name 'Process structured data for evidence'
            notes 'GPS analysis, email patterns, timeline construction, quantitative extraction.'
        end
    end

    category do
        id 'Academic'
        entry do
            command 'assignment-reviewer'
            name 'HD-standard feedback on legal assignments'
            notes 'Legal accuracy checks, AGLC4 compliance, professional critique.'
        end
        entry do
            command 'study-guide-generator'
            name 'Generate weekly study notes from materials'
            notes 'Comprehensive notes with exam likelihood indicators.'
        end
        entry do
            command 'case-irac-analyser'
            name 'Analyse cases in IRAC format'
            notes 'Ratio extraction, related authorities, exam-ready summaries.'
        end
        entry do
            command 'citation-compliance'
            name 'Verify AGLC4 citation compliance'
            notes 'Checks refs.bib, validates pinpoint references.'
        end
        entry do
            command 'authority-fetcher'
            name 'Fetch authorities from AustLII'
            notes 'Extracts full text, creates IRAC summaries for case law collections.'
        end
        entry do
            command 'flashcard-generator'
            name 'Generate Anki flashcards from materials'
            notes 'Spaced repetition cards for legal concepts, cases, statutes.'
        end
    end

    category do
        id 'General'
        entry do
            command 'doc-reviewer'
            name 'Review documentation quality'
            notes 'Checks consistency, formatting, completeness, cross-references.'
        end
        entry do
            command 'claude-config-documenter'
            name 'Document Claude Code architecture'
            notes 'Scans skills, agents, hooks. Generates Mermaid diagrams.'
        end
    end

    notes <<-'END'
        * Agents are stored in `~/.claude/agents/<category>/<name>.md`
        * Spawn via Task tool: `Task(subagent_type="agent-name", prompt="...")`
        * Agents run autonomously and return results to the main conversation
        * Each agent has specific tools available based on its purpose
    END

end
