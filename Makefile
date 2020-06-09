CMD_HEAD = docker run --rm -v $(shell pwd):/documents/ --user "$(shell id -u):$(shell id -g)" asciidoctor/docker-asciidoctor
TGT_DIR = /documents/build
CMD_TAIL = /documents/index.adoc -o $(TGT_DIR)

html:
	$(CMD_HEAD) asciidoctor $(CMD_TAIL)/index.html

pdf:
	$(CMD_HEAD) asciidoctor-pdf $(CMD_TAIL)/index.pdf

clean:
	cd tgt && GLOBIGNORE=.gitignore rm -v *

default: html
