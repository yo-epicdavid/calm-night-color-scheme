# Calm Night

A low-eye-strain dark theme for people who read code for hours at a time — tuned against the perceptual research on what actually causes screen fatigue, and ported consistently across the terminal, four editors/IDEs, and their integrated terminals.

Two variants ship everywhere:

- **Calm Night** — the full palette (7 syntax hues).
- **Calm Night Minimal** — a 3-hue variant that spends color only where it earns its keep (strings, magnitudes/types, comments) and leaves everything else a calm off-white. Lower visual load for long reading sessions.

A single warm-yellow accent (`#f0c674`) runs through the cursor and UI focus in every target, so your whole environment reads as one system.

> **Why this exists, with citations:** see **[docs/RESEARCH.md](docs/RESEARCH.md)**. The short version: don't max out contrast (halation), desaturate (chromatic aberration), and cap the number of simultaneous colors (cognitive load). The palette and both variants are built around those three findings.

## Supported platforms

| Platform | What's themed | Variants |
|---|---|---|
| **Ghostty** | terminal + 16 ANSI colors | full |
| **VS Code** | workbench UI, editor, syntax, semantic tokens, integrated terminal | full + minimal |
| **JetBrains** (IntelliJ, WebStorm, PhpStorm, DataGrip, PyCharm, GoLand, …) | full IDE UI theme, editor, console/terminal, diff | full + minimal |
| **Neovim** | UI, Treesitter, LSP semantics, diagnostics, git, `:terminal`, + neo-tree/telescope/lualine/cmp/gitsigns | full + minimal |
| **Vim** | UI, syntax, NERDTree/CoC/GitGutter/Startify, `:terminal`, lightline | full + minimal |

## Install

**Ghostty** — copy [`ghostty/calm-night`](ghostty/calm-night) into your Ghostty `themes/` directory and add `theme = calm-night` to your config.

**VS Code** — once published, install "Calm Night" from the Marketplace / Open VSX. To sideload now: build a `.vsix` from [`vscode/`](vscode/) and `code --install-extension calm-night.vsix`, then pick it with `Cmd/Ctrl+K Cmd/Ctrl+T`.

**JetBrains** — once published, install "Calm Night" from Settings → Plugins → Marketplace. To sideload: drop the built plugin jar into your IDE's config `plugins/` directory. Select it under Settings → Appearance → Theme, and the editor scheme under Editor → Color Scheme.

**Neovim** (lazy.nvim) — colorschemes live in [`colors/`](colors) at the repo root, so a plain spec works:

```lua
{ "yo-epicdavid/calm-night-color-scheme", lazy = false, priority = 1000,
  config = function() vim.cmd.colorscheme("calmnight_minimal") end }
```

**Vim** (vim-plug) — point Vim's runtimepath at the [`vim/`](vim) subdirectory:

```vim
Plug 'yo-epicdavid/calm-night-color-scheme', { 'rtp': 'vim' }
" then, after plug#end():  colorscheme calmnight_minimal
```

Full per-platform notes live in each subdirectory.

## Palette

Canonical colors and the token→color mapping (full and minimal) are in **[docs/palette.md](docs/palette.md)**.

## Credits & license

The base palette derives from **[Tomorrow Night](https://github.com/chriskempson/tomorrow-theme)** by Chris Kempson (MIT). Calm Night's contribution is the readability tuning (softened foreground to avoid halation, legibility-corrected comments, the 3-hue Minimal variant), the consistent cross-platform port, and the research writeup. Released under the **[MIT License](LICENSE)**.
