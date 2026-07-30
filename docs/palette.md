# Palette reference

## Core colors

| Role | Hex | Notes |
|---|---|---|
| Background (editor) | `#282c34` | dark gray, never pure black |
| Background (chrome) | `#21252b` | tool windows / sidebars |
| Background (deepest) | `#1b1d23` | wells, inputs |
| Current line / hover | `#2c313a` | |
| Selection | `#373b41` | |
| Foreground | `#c5c8c6` | off-white; ≈ 8.3:1 on bg |
| Comment / secondary | `#969896` | ≈ 4.8:1 on bg (passes AA) |
| Faint (line numbers) | `#5c6370` | |
| **Accent (cursor/UI)** | **`#f0c674`** | the one warm accent, everywhere |

## Accent hues (desaturated Tomorrow-Night family)

| Hue | Normal | Bright |
|---|---|---|
| Red | `#cc6666` | `#d54e53` |
| Orange/amber | `#de935f` | — |
| Yellow | `#f0c674` | `#e7c547` |
| Green | `#b5bd68` | `#b9ca4a` |
| Cyan | `#8abeb7` | `#70c0b1` |
| Blue | `#81a2be` | `#7aa6da` |
| Purple | `#b294bb` | `#c397d8` |

## Terminal ANSI (0–15)

`#1d1f21` `#cc6666` `#b5bd68` `#f0c674` `#81a2be` `#b294bb` `#8abeb7` `#c5c8c6`
`#969896` `#d54e53` `#b9ca4a` `#e7c547` `#7aa6da` `#c397d8` `#70c0b1` `#eaeaea`

## Token → color mapping

| Token | Full variant | Minimal variant |
|---|---|---|
| Comment | `#969896` italic | `#969896` italic |
| String | `#b5bd68` green | `#b5bd68` green |
| Number / constant | `#de935f` amber | `#de935f` amber |
| Type / class | `#f0c674` yellow | `#de935f` amber |
| Keyword | `#b294bb` purple | `#c5c8c6` neutral |
| Function | `#81a2be` blue | `#c5c8c6` neutral |
| Variable / parameter | `#c5c8c6` neutral | `#c5c8c6` neutral |
| Property / field | `#cc6666` red | `#c5c8c6` neutral |
| Operator / punctuation | `#969896` dim | `#969896` dim |
| Cursor / selection / focus | `#f0c674` yellow | `#f0c674` yellow |

The **Minimal** variant collapses to three syntax hues (green / amber / gray) plus the yellow accent — everything else is neutral off-white. See [RESEARCH.md](RESEARCH.md) §4–5 for why.
