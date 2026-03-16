# Project Handover Document

## Overview

This project is a Neovim configuration written in Lua. It organizes settings, key mappings, and plugin setups in a modular structure.

## Project Structure

- `init.lua`: Entry point of the configuration. It loads the following modules:
  - `settings`: General Neovim settings.
  - `mappings`: Custom key mappings.
  - `autocmds`: Autocommand definitions (currently empty).
  - `lazy`: Plugin manager setup using `lazy.nvim`.

### Modules

#### `settings.lua`

Contains general Neovim settings such as:

- Cursor, number, and tab settings.
- Undo and clipboard management.
- Statusline customization.

#### `mappings.lua`

Defines key mappings, such as:

- `<leader>` as the leader key.
- `<leader>e` for opening the file explorer.

#### `autocmds.lua`

Currently empty but reserved for autocommand definitions.

#### `lazy.lua`

Sets up the `lazy.nvim` plugin manager. Automatically clones the plugin if it doesn't exist and loads plugins from the `plugins` directory.

### Plugins Directory

Contains Lua files for configuring individual plugins, such as:

- `treesitter.lua`: Syntax highlighting.
- `telescope.lua`: File searching.
- `lspconfig.lua`: Language Server Protocol (LSP) configurations.
- And more.

## How to Extend

1. Add new settings in `settings.lua`.
2. Define new key mappings in `mappings.lua`.
3. Add autocommands in `autocmds.lua`.
4. To add plugins, configure them in the `plugins` directory and include them in the `lazy.nvim` setup.

## Notes

- Ensure all paths are correctly updated when adding new files or plugins.
- Use the `lazy.nvim` documentation for advanced plugin configurations.
