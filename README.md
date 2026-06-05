# exam-cheatsheet

A high-density LaTeX cheatsheet template for open-book exams. Supports both **Chinese** and **English** with a single `.cls` file.

[中文文档](README_ZH.md)

## Preview

| Dense (5-col, 6pt) | Spacious (4-col, 6.5pt) |
|:---:|:---:|
| ![dense](screenshots/dense-preview.png) | ![spacious](screenshots/spacious-preview.png) |

## Two Styles

| | Dense | Spacious |
|---|---|---|
| **When** | Lots of content, every mm counts | Less content, readability matters |
| **How** | Plain text + inline `\concept{}` `\compare{}` | Boxed environments (`cmpbox`, `thmbox`, `formula`...) |
| **Typical** | 5 cols, 6pt | 3–4 cols, 6.5–7pt |
| **Examples** | `zh/dense.tex`, `en/dense.tex` | `zh/spacious.tex`, `en/spacious.tex` |

Mix and match — use dense text for most sections, boxed environments only where visual distinction truly helps.

## Quick Start

```bash
git clone https://github.com/wwoozyq/exam-cheatsheet.git
cd exam-cheatsheet

# Pick a starting point and edit
cp zh/dense.tex zh/my-exam.tex
vim zh/my-exam.tex

# Build
cd zh && latexmk -xelatex my-exam.tex
```

## Usage

```latex
\documentclass[
  lang=zh,          % zh | en
  cols=5,           % 3 | 4 | 5 | 6
  paper=a4,         % a4 | a3 | b5
  fontsize=6pt,     % 5pt - 8pt
  scheme=classic,   % classic | ocean | forest | sunset | mono
]{cheatsheet}

\begin{document}
\startcols

% Dense style — plain text, inline highlights
\section{Topic A}
\concept{Key idea}: explanation $O(n\log n)$\\
\compare{X vs Y}: X does this; Y does that

% Spacious style — boxed environments where it helps
\begin{cmpbox}[A vs B]
A: property1, property2\\
B: property3, property4
\end{cmpbox}

\stopcols
\end{document}
```

## Options

| Option | Values | Default | Description |
|--------|--------|---------|-------------|
| `lang` | `zh`, `en` | `zh` | Language (affects fonts & abbreviations) |
| `cols` | `3`–`6` | `5` | Number of columns |
| `paper` | `a4`, `a3`, `b5` | `a4` | Paper size |
| `fontsize` | `5pt`–`8pt` | `6pt` | Base font size |
| `scheme` | `classic`, `ocean`, `forest`, `sunset`, `mono` | `classic` | Color scheme |

## Environments

Use these when you have room and visual grouping helps. Skip them when density is the priority.

| Environment | Purpose | Visual |
|-------------|---------|--------|
| `cmpbox[title]` | Compare/contrast | Red left bar |
| `thmbox[title]` | Theorem/formula | Blue left bar |
| `warnbox[title]` | Warning/pitfall | Orange left bar |
| `codebox[title]` | Code/pseudocode | Gray background |
| `formula[title]` | Must-memorize formula | Yellow background |

## Highlight Commands

Inline commands work in both dense and spacious styles.

| Command | Purpose |
|---------|---------|
| `\concept{text}` | Key concept (cyan bold) |
| `\process{text}` | Process/step (purple bold) |
| `\category{text}` | Category/type (green bold) |
| `\compare{text}` | Contrast point (red bold) |
| `\important{text}` | Important note (blue bold) |

## Abbreviation Macros

**Chinese mode:** `\dn` (定义), `\thm` (定理), `\prf` (证), `\eg` (例), `\nb` (注)

**English mode:** `\defn` (Def.), `\thm` (Thm.), `\prf` (Pf.), `\eg` (e.g.), `\nb` (N.B.)

**Both:** `\iff` ($\Leftrightarrow$), `\imp` ($\Rightarrow$), `\bcs` ($\because$), `\so` ($\therefore$)

## Requirements

- **XeLaTeX** (via TeX Live or MiKTeX)
- **latexmk** (for Makefile builds)
- Chinese mode uses system CJK fonts automatically (macOS: Songti/Heiti, Linux: Fandol/Noto, Windows: SimSun/SimHei)

## Color Schemes

| Scheme | Style |
|--------|-------|
| `classic` | Blue/purple/cyan — versatile default |
| `ocean` | Blue/teal — easy on the eyes |
| `forest` | Green/brown — calm, earthy |
| `sunset` | Warm reds/oranges — high contrast |
| `mono` | Grayscale — B&W print friendly |

## License

MIT
