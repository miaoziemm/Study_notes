# 简易构建：需要已安装 latexmk 与 XeLaTeX
# macOS 可用 Homebrew: brew install latexmk

TARGET=main

.PHONY: all clean pdf

all: pdf

pdf:
	latexmk -xelatex -interaction=nonstopmode $(TARGET).tex

clean:
	latexmk -C
