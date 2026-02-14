# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains cheatsheets for [Dash](https://kapeli.com/dash) (macOS documentation browser) and [Zeal](https://zealdocs.org/) (cross-platform equivalent). Cheatsheets are written in Ruby DSL format and can be contributed to the official [Kapeli cheatsheets repository](https://github.com/Kapeli/cheatsheets).

## Cheatsheet DSL Structure

Each cheatsheet is a `.rb` file using this structure:

```ruby
cheatsheet do
    title 'Tool Name'           # Display name in Dash
    docset_file_name 'Tool_Name' # Filename (use underscores)
    keyword 'tool'              # Search keyword in Dash
    source_url 'http://cheat.kapeli.com'

    introduction <<-'END'
    Brief description and install instructions.
    END

    category do
        id 'Category Name'
        entry do
            command 'command'
            name 'Description of what it does'
            notes 'Optional additional details'
        end
    end

    notes <<-'END'
        * Footer notes and links
    END
end
```

## Key Elements

- **entry**: Each command/shortcut/reference item
- **command**: The actual command, shortcut, or syntax (displayed prominently)
- **name**: Brief description (keep concise)
- **notes**: Optional extended explanation or examples
- **category**: Groups related entries together

## Building Docsets

Build all cheatsheets using Docker (requires Docker):

```bash
./build.sh
```

This uses Ruby 2.7 + cheatset in Docker to generate `.docset` files. The cheatset gem has strict Ruby version requirements that don't work with modern Ruby.

Install to Dash:

```bash
cp -r *.docset ~/Library/Application\ Support/Dash/Cheat\ Sheets/
# Then restart Dash or rescan cheatsheets from Preferences
```

## Contributing to Kapeli

To submit cheatsheets upstream:
1. Fork [Kapeli/cheatsheets](https://github.com/Kapeli/cheatsheets)
2. Add your `.rb` file to the `cheatsheets/` directory
3. Open a pull request
