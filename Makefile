# Makefile for no-proxy-mode
EMACS = emacs
FILE = $(wildcard no-proxy-mode.el)

.PHONY: all clean

all:	*.el
	$(EMACS) --batch -Q --no-site-file --eval '(byte-compile-file "$(FILE)")'

clean:
	rm -f *~
	rm -f \#*\#
	rm -f *.elc
