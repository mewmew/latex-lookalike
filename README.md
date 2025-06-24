# LaTeX styles for Typst

```bash
# Init new example document based on latex-lookalike template.
typst init @local/latex-lookalike
```

## Outline

```typst
// Style outline as LaTeX "Table of contents".
#show: latex-lookalike.style_outline
```

Before (default Typst style):
![before](inc/outline_before.png)

After (with `latex-lookalike.style_outline` applied):
![after](inc/outline_after.png)

# Local development

Make package available to Typst under `@local/latex-lookalike:0.1.0`.
```bash
mkdir -p ~/.local/share/typst/packages/local/latex-lookalike
ln -s "$(realpath latex-lookalike)"  ~/.local/share/typst/packages/local/latex-lookalike/0.1.0
```
