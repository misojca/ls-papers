# Per-paper build overrides for the master thesis (issue #22).
# Included by shared/build.mk (via `-include paper.mk`).
#
# FTN master thesis: Serbian (Cyrillic), author-date citations (APA-style, as in
# the reference template), and the FTN master Word template for DOCX output.
# Lokalna kopija APA stila: u listi literature ne prikazuje "(без датума)".
CSL := apa-bez-datuma.csl
DOCX_TEMPLATE := $(SHARED)/resources/ftn-master-thesis-template.docx
# Lua filter: horizontalne linije izmedju redova tabela oznacenih sa .row-rules (samo PDF).
PANDOC_EXTRA := --lua-filter=row-rules.lua
