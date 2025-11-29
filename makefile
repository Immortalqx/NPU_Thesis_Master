# =============================
# 默认目标：编译 main.tex（带参考文献）
# =============================
.DEFAULT_GOAL := mainbib

TEX     = xelatex
BIB     = bibtex
MKI     = makeindex
TEXARGS = -synctex=1 -shell-escape

# 平台检测（只用来选清理命令）
ifeq ($(OS), Windows_NT)
    RM = del /s /f
else
    RM = rm -rf
endif

# =============================
# 主要目标
# =============================

# 快速编译：只跑 XeLaTeX，不更新参考文献
main: texmain

# 完整编译：XeLaTeX + BibTeX + XeLaTeX×2
mainbib: texmainbib

# =============================
# 编译规则
# =============================

# 只跑 LaTeX（一般用于快速检查不涉及引用）
texmain: main.tex
	$(TEX) $(TEXARGS) $<
	-$(MKI) main.nlo -s nomencl.ist -o main.nls
	$(TEX) $(TEXARGS) $<

# LaTeX + BibTeX + LaTeX x2（完整流程）
texmainbib: main.tex
	$(TEX) $(TEXARGS) $<
	$(BIB) main.aux
	-$(MKI) main.nlo -s nomencl.ist -o main.nls
	$(TEX) $(TEXARGS) $<
	$(TEX) $(TEXARGS) $<

# =============================
# 清理
# =============================

clean:
	$(RM) *.gls *.glo *.ind main.idx
	$(RM) *.ilg *.aux *.toc
	$(RM) *.hd *.out *.thm *.gz *.nlo *.nls
	$(RM) *.log *.lof *.lot *.bbl *.blg

.PHONY: main mainbib texmain texmainbib clean