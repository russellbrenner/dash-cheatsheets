# Building Cheatsheets

This document covers the cheatsheet DSL, build process, and troubleshooting.

## Table of Contents

- [Requirements](#requirements)
- [Build Process](#build-process)
- [Cheatsheet DSL Reference](#cheatsheet-dsl-reference)
- [Examples](#examples)
- [Troubleshooting](#troubleshooting)
- [Manual Build](#manual-build)

## Requirements

### For Building

- **Docker** — The build script uses a containerised Ruby 2.7 environment
- **macOS, Linux, or WSL** — For running the build script

### For Viewing

- **Dash** (macOS) — https://kapeli.com/dash
- **Zeal** (Linux/Windows) — https://zealdocs.org/

## Build Process

### Using the Build Script (Recommended)

```bash
./build.sh
```

This script:
1. Starts a Docker container with Ruby 2.7-bullseye
2. Installs the `cheatset` gem and dependencies
3. Generates `.docset` bundles for each `cheatsheets_*.rb` file
4. Outputs docsets to the current directory

### Installing Docsets

**Dash (macOS):**
```bash
cp -r *.docset ~/Library/Application\ Support/Dash/Cheat\ Sheets/
```

**Zeal (Linux):**
```bash
cp -r *.docset ~/.local/share/Zeal/Zeal/docsets/
```

**Zeal (Windows):**
```powershell
Copy-Item -Recurse *.docset "$env:APPDATA\Zeal\Zeal\docsets\"
```

After copying, restart the application or use the rescan option in Preferences.

## Cheatsheet DSL Reference

Cheatsheets are Ruby files using a domain-specific language provided by [cheatset](https://github.com/Kapeli/cheatset).

### Basic Structure

```ruby
cheatsheet do
    title 'Tool Name'           # Display name in Dash
    docset_file_name 'Tool_Name' # Output filename (use underscores)
    keyword 'tool'              # Search prefix in Dash
    source_url 'http://cheat.kapeli.com'

    introduction <<-'END'
    Introduction text supporting **Markdown**.
    END

    category do
        id 'Category Name'

        entry do
            command 'command'
            name 'Description'
            notes 'Extended notes'
        end
    end

    notes <<-'END'
        * Footer notes
    END
end
```

### Top-Level Elements

| Element | Required | Description |
|---------|----------|-------------|
| `title` | Yes | Display name shown in Dash |
| `docset_file_name` | Yes | Output filename (without .docset extension) |
| `keyword` | Yes | Search prefix (e.g., `keyword:search`) |
| `source_url` | No | Link shown in footer for contributions |
| `introduction` | No | Markdown text at the top of the cheatsheet |
| `notes` | No | Markdown text at the bottom |
| `style` | No | Custom CSS to inject |

### Categories

Categories group related entries:

```ruby
category do
    id 'Category Name'      # Required: section heading

    entry do
        # ... entries
    end
end
```

### Entries

Each entry represents one item in the cheatsheet:

```ruby
entry do
    command 'primary command'           # Displayed prominently
    command 'alternative command'       # Multiple commands allowed
    name 'Brief description'            # Main description text
    index_name 'Search Index Name'      # Alternative name for search index
    notes 'Extended explanation'        # Additional details (Markdown)
    html_notes '<em>HTML notes</em>'    # Raw HTML notes
end
```

| Element | Required | Description |
|---------|----------|-------------|
| `command` | No* | Command, shortcut, or syntax (can have multiple) |
| `name` | No* | Brief description |
| `index_name` | No | Alternative text for search indexing |
| `notes` | No | Extended explanation (Markdown supported) |
| `html_notes` | No | Raw HTML content |

*At least one of `command`, `name`, or `index_name` is required.

### Table-Style Categories

For tabular data, use `td_command` and `td_notes`:

```ruby
category do
    id 'Comparison'
    header ['Option', 'Description', 'Default']

    entry do
        td_command ['--verbose', 'Enable verbose output', 'false']
    end
    entry do
        td_command ['--quiet', 'Suppress output', 'false']
    end
end
```

### Markdown Support

The `introduction`, `notes`, and entry `notes` fields support Markdown:

```ruby
introduction <<-'END'
# Heading

This supports **bold**, *italic*, and `code`.

```bash
code blocks work too
```

- Bullet lists
- [Links](https://example.com)
END
```

### Style Customisation

Inject custom CSS:

```ruby
style <<-'END'
.category { background: #f5f5f5; }
.command code { color: #d73a49; }
END
```

## Examples

### Simple Command Reference

```ruby
cheatsheet do
    title 'Git Basics'
    docset_file_name 'Git_Basics'
    keyword 'gitb'

    category do
        id 'Setup'
        entry do
            command 'git init'
            name 'Initialise a new repository'
        end
        entry do
            command 'git clone URL'
            name 'Clone a remote repository'
        end
    end

    category do
        id 'Daily Workflow'
        entry do
            command 'git add FILE'
            command 'git add .'
            name 'Stage changes'
            notes 'Use `.` to stage all changes in the current directory'
        end
    end
end
```

### Keyboard Shortcuts

```ruby
cheatsheet do
    title 'VS Code Shortcuts'
    docset_file_name 'VSCode_Shortcuts'
    keyword 'vsc'

    category do
        id 'Navigation'
        entry do
            command 'CMD+P'
            name 'Quick open file'
        end
        entry do
            command 'CMD+SHIFT+P'
            name 'Command palette'
        end
    end
end
```

### API Reference

```ruby
cheatsheet do
    title 'REST API'
    docset_file_name 'REST_API'
    keyword 'api'

    category do
        id 'Endpoints'
        header ['Method', 'Path', 'Description']

        entry do
            td_command ['GET', '/users', 'List all users']
        end
        entry do
            td_command ['POST', '/users', 'Create a user']
        end
        entry do
            td_command ['GET', '/users/:id', 'Get user by ID']
        end
    end
end
```

## Troubleshooting

### Build Fails with Ruby Version Errors

The `cheatset` gem requires Ruby 2.7 due to deprecated APIs in newer Ruby versions. The build script handles this by using Docker, but if you're building manually:

```bash
# Use Ruby 2.7 specifically
rbenv install 2.7.8
rbenv local 2.7.8
gem install cheatset
```

### Docker Build Fails

If the Docker build fails:

1. Ensure Docker is running
2. Check you have internet access (gems are downloaded)
3. Try pulling the image manually: `docker pull ruby:2.7-bullseye`

### Docsets Don't Appear in Dash

1. Verify the docset was copied to the correct location
2. Check Dash Preferences > Cheat Sheets
3. Click "Rescan Cheat Sheets"
4. Restart Dash

### Search Index Issues

If entries aren't appearing in search:

- Ensure each entry has at least one of: `command`, `name`, or `index_name`
- Check that category `id` values are unique
- Rebuild the docset

## Manual Build

If you can't use Docker, install Ruby 2.7 natively:

### macOS (with rbenv)

```bash
brew install rbenv ruby-build
rbenv install 2.7.8
rbenv local 2.7.8

gem install nokogiri -v 1.15.7 --platform=ruby
gem install cheatset

cheatset generate cheatsheets_My_Tool.rb
```

### Debian/Ubuntu

```bash
sudo apt-get install ruby2.7 ruby2.7-dev libsqlite3-dev
gem install cheatset
cheatset generate cheatsheets_My_Tool.rb
```

## Docset Structure

For reference, generated docsets have this structure:

```
My_Tool.docset/
└── Contents/
    ├── Info.plist          # Metadata (title, keyword, etc.)
    └── Resources/
        ├── docSet.dsidx    # SQLite search index
        └── Documents/
            ├── index.html  # Main content
            ├── style.css   # Stylesheet
            └── cheatset_resources/
                └── *.woff  # Fonts
```

## References

- [cheatset README](https://github.com/Kapeli/cheatset#readme) — Official documentation
- [Kapeli/cheatsheets](https://github.com/Kapeli/cheatsheets) — Official cheatsheet repository
- [Dash Documentation](https://kapeli.com/dash) — Dash app documentation
