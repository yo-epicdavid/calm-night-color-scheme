# The research behind Calm Night

This theme isn't tuned by taste alone. Every choice traces to a finding about how the eye and visual system behave during long reading. This document lays out those findings, the design rules that follow, and — honestly — where the evidence is strong and where it's thin.

A caveat up front: the science on **screen/reading physiology** (contrast, halation, color focus, cognitive load) is solid. The science on *syntax highlighting colors specifically* is thin and partly inconclusive. Calm Night leans on the former and treats the latter with appropriate humility.

---

## 1. Don't max out contrast — it causes halation

The intuition "more contrast = more readable" is wrong past a point. Pure white (`#ffffff`) text on a dark background **halates**: the glyph edges bloom and glow, so characters look fuzzy. It's worst for the roughly **half of the population with some astigmatism**, for whom a dark screen dilates the pupil and exaggerates the lens's imperfect focus, but it tires everyone over hours.

The fixes are two-fold and both are in Calm Night:

- **Foreground is off-white `#c5c8c6`, not pure white.** On the `#282c34` background that's ≈ **8.3:1** contrast — comfortably above the WCAG AA 4.5:1 floor for body text, but well short of the harsh ≈ 14:1 that pure white would give. The comfort zone is "clearly above the floor," not "maximal."
- **Background is a dark gray, never pure black.** A non-black background emits a little light of its own, so bright text bleeds less against it.

Sources: [Why you should never use pure black — UX Movement](https://uxmovement.com/content/why-you-should-never-use-pure-black-for-text-or-backgrounds/) · [White text on black & astigmatism — Jessica Otis](https://jessicaotis.com/academia/never-use-white-text-on-a-black-background-astygmatism-and-conference-slides/) · [Accessibility for astigmatism — Level Access](https://www.levelaccess.com/blog/accessibility-for-people-with-astigmatism/)

## 2. Legible ≠ maximal, but recede ≠ invisible

The mirror of rule 1: tokens meant to *recede* (comments, punctuation) still have to be **readable**. A common failure — Ghostty's own default among them — sets comments to `#666666`, which on this background is ≈ **2.4:1 and fails WCAG AA**; you unconsciously squint at every comment. Calm Night raises comments to `#969896` (≈ **4.8:1**): they recede, but you can still read them without effort.

## 3. Desaturate — saturated color forces the eye to refocus

The eye focuses different wavelengths at slightly different depths (longitudinal **chromatic aberration**). Highly saturated colors — especially pure blues and reds — sit at the extremes and make the lens work to hold focus, particularly against a dark field. Calm Night uses the muted, balanced hues of the Tomorrow Night family rather than neon accents, so no token color fights your focus.

This is the same principle behind **Solarized**, which was designed in the CIELAB color space with deliberately *reduced* brightness contrast and hues chosen off fixed color-wheel relationships — the "reading shaded paper, not paper in direct sunlight" idea. Sources: [Solarized — Ethan Schoonover](https://ethanschoonover.com/solarized/) · [Solarized helps you code longer — TNW](https://thenextweb.com/news/solarized-color-schemes-help-you-code-longer)

## 4. Cap the number of simultaneous colors — this is separate from contrast

Contrast decides whether you *can* read a token; the **count of distinct colors** decides how much your visual system juggles while reading everything around it. Even with perfect contrast, each additional color category adds load:

- **Categorical color has a ceiling.** Perception research and standard data-viz practice put the number of *reliably distinguishable* categorical colors at roughly **7–10** — but accuracy drops and load rises well before that ceiling, and for continuous *reading* (not one-off lookup) the comfortable number is lower still.
- **The effortless zone is ~4.** Small quantities are *subitized* — grasped without counting; beyond ~4, processing turns slow and serial.
- **Salience is a scarce resource.** One bright token in a neutral field "pops out" preattentively, for free. Color *everything* and nothing pops — you've spent the whole salience budget.

Sources: [Choosing colors for data viz — Atlassian](https://www.atlassian.com/data/charts/how-to-choose-colors-data-visualization) · [Reducing cognitive load in viz](https://www.turningdataintowisdom.com/content/files/2025/05/data-visualization-design-guide-1.html) · [Subitizing in visualization — arXiv](https://arxiv.org/html/2508.17460)

## 5. Syntax highlighting: spend color where it pays

Here the evidence is genuinely mixed. A controlled study (Sarkar, PPIG 2015) found highlighting **did** help — ~8.4s faster on tasks and fewer eye-tracking context-switches, implying lower load — **but the benefit shrank as programming experience rose**, and other studies found no comprehension benefit at all. The recognized failure mode is the **"Christmas tree effect"**: when a six-line snippet uses six colors, no single color carries a learnable meaning anymore, so the coloring stops encoding information and just adds noise. Notably, researchers observe that syntax highlighting has **no principled design basis** — nobody established what *should* be colored.

Calm Night's answer is **minimum sufficient color**: reserve hue for the distinctions with the highest payoff and neutralize the rest.

- **Full variant** — a restrained 7 hues (strings, numbers/constants, functions, types, keywords, comments, plus markup), all desaturated.
- **Minimal variant** — 3 hues only: **strings** (green — they separate data from code), **numbers/constants/types** (amber — literal magnitudes and shapes), and **comments** (dim gray). Everything else is neutral off-white, so the lone yellow cursor keeps its pop-out salience.

Sources: [The impact of syntax colouring on program comprehension — Sarkar 2015 (PPIG)](https://ppig.org/files/2015-PPIG-26th-Sarkar1.pdf) · [On the design of text editors — arXiv](https://arxiv.org/pdf/2008.06030) · [A developer's guide to preventing eye strain](https://lookaway.com/blog/2026/01/21/a-developers-guide-to-preventing-eye-strain-while-coding/)

---

## How the rules map to the palette

| Rule | Decision in Calm Night |
|---|---|
| No halation | fg `#c5c8c6` (not `#ffffff`); bg `#282c34` (not `#000000`); ≈ 8.3:1, not 14:1 |
| Recede ≠ invisible | comments `#969896` (≈ 4.8:1, passes AA) |
| Desaturate | muted Tomorrow-Night hues; no neon; blue kept gentle |
| Cap color count | Minimal variant = 3 syntax hues + 1 accent |
| Spend color where it pays | color reserved for strings, magnitudes/types, comments; one yellow accent for the cursor |

## A note on evidence quality

- **Strong:** contrast polarity / halation, chromatic aberration, categorical-color and working-memory limits. These are well-replicated perceptual findings.
- **Mixed / weak:** whether syntax highlighting *colors specifically* improve comprehension. Treat any theme's "this makes you faster" claim (including this one) as plausible, not proven. The safe, defensible move — and the one Calm Night makes — is to reduce strain physiologically and keep color count low, which the stronger literature supports directly.
