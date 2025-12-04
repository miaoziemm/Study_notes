# 中文 LaTeX 讲义模板

一个可直接编译的中文书籍模板，使用 XeLaTeX + ctex，适合分章节维护，含简易封面。

## 结构

- `main.tex`: 主文件，组织封面、目录、章节。
- `preamble.tex`: 导言区（中文、数学、页面、链接等统一设置）。
- `cover.tex`: 简单封面页，可改标题、作者、日期。
- `chapters/chap-intro.tex`: 示例章节（中文说明）。
- `chapters/chap-math.tex`: 示例章节（公式与定理）。
- `Makefile`: 构建脚本（使用 `latexmk -xelatex`）。

## 编译

建议安装 `MacTeX`（含 XeLaTeX 与 latexmk）。

### 使用 Makefile（推荐）

```zsh
cd /Users/changzhimiao/develope_Changzhimiao/Study_notes/latex-notes
make
```

生成的 PDF 位于 `main.pdf`。

### 手动命令

```zsh
cd /Users/changzhimiao/develope_Changzhimiao/Study_notes/latex-notes
latexmk -xelatex -interaction=nonstopmode main.tex
```

## 管理章节

- 在 `chapters/` 新增文件，例如 `chapters/chap-xxx.tex`。
- 在 `main.tex` 中使用：

```tex
\include{chapters/chap-xxx}
```

- `\include` 有分页与独立辅助文件，适合章节级管理；若仅插入片段，亦可使用 `\input{...}`。

## 参考文献

- 已集成 `biblatex` + `biber`（在 `preamble.tex` 中）。
- 参考文献库：`references.bib`，支持中英文条目（见示例）。
- 在正文中引用：

```tex
% 行内作者-年份：
	extcite{lamport1994latex}
% 括号形式：
\parencite{ctex-doc,zhang2020example}
```

- 文末打印：已在 `main.tex` 的 `\backmatter` 中添加 `\printbibliography`。
- 更换样式：在 `preamble.tex` 的 `\\usepackage[backend=biber,style=authoryear,...]{biblatex}` 中修改 `style`（如 `numeric`、`authoryear`、`alphabetic`）。
- 国标样式（可选）：安装 `biblatex-gb7714-2015` 后将 `style=gb7714-2015`。

## 中文与公式

- 通过 `\usepackage[UTF8]{ctex}` 启用中文；确保使用 XeLaTeX 编译。
- 数学环境已启用 `amsmath,amssymb,amsthm,mathtools`，可直接书写 `$...$`、`\[...\]`、`equation` 等。

## 自定义封面

修改 `cover.tex` 的标题、作者、日期；也可在 `main.tex` 中改动 `\title`、`\author`、`\date`。

## 图片与表格

- 将图片放在 `images/`（自行创建），用 `\includegraphics{images/xxx}` 引用。
- 使用 `booktabs` 出高质量表格。

## 常见问题

- 若中文不显示或报编码错误：确认使用 XeLaTeX（不是 pdflatex）。
- 若缺少 `latexmk`：用 Homebrew 安装 `brew install latexmk`。
- 若字体问题：MacTeX 默认中文字体一般可用，必要时可在 `ctex` 文档中查看自定义方案。
- 若参考文献不出现：确认 `latexmk` 已自动调用 `biber`（或手工执行 `biber main`），然后再次编译。
