# CRUSH.md - Chezmoi Dotfiles Repository

## Commands
- **Apply changes**: `chezmoi apply`
- **Check diff**: `chezmoi diff`
- **Add file**: `chezmoi add <file>`
- **Edit template**: `chezmoi edit <file>`
- **Re-add modified files**: `chezmoi re-add`
- **Lint Lua**: `stylua --check .` (in hammerspoon dir)
- **Format Lua**: `stylua .` (in hammerspoon dir)
- **Run sketchybar dev**: `mise run dev` (in sketchybar dir)
- **Reload sketchybar**: `mise run reload` (in sketchybar dir)
- **Test single file**: Use neotest in nvim (`:Neotest run file`)

## Code Style Guidelines
- **Lua**: Use stylua formatter, Lua53 syntax, no call parentheses, never collapse statements
- **Shell scripts**: Use shfmt for formatting
- **PHP**: Use Laravel Pint for formatting
- **JavaScript**: Use prettierd for formatting
- **HTML/Blade**: Use prettierd + rustywind for formatting
- **Ruby**: Use rubocop for formatting
- **File naming**: Use chezmoi conventions (dot_ prefix, exact_ for dirs, executable_ for scripts)
- **Templates**: Use .tmpl extension for templated files
- **Secrets**: Encrypt with age (.age extension)
- **Configuration**: Prefer TOML/YAML over JSON where possible
- **Scripts**: Include shebang, make executable with chezmoi
- **Comments**: Minimal comments, prefer self-documenting code
- **Imports**: Group and sort imports logically
- **Error handling**: Use appropriate error handling for each language
- **Types**: Use type annotations where supported (TypeScript, Python, etc.)

## Tools
- **Package manager**: mise (replaces asdf/homebrew for most tools)
- **Editor**: Neovim with LazyVim
- **Shell**: Zsh with prezto
- **Terminal**: Multiple (kitty, wezterm, alacritty)
- **File manager**: yazi
- **Git UI**: lazygit