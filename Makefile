
all: pdf html epub

# --events-backend=file is only needed on Windows/WSL2 because
# there is no systemd/journald to send events to
html:
	@podman run --events-backend=file --rm -v .:/documents/ asciidoctor/docker-asciidoctor asciidoctor -r asciidoctor-diagram main.adoc

pdf:
	@podman run --events-backend=file --rm -v .:/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf -r asciidoctor-diagram main.adoc

epub:
	@podman run --events-backend=file --rm -v .:/documents/ asciidoctor/docker-asciidoctor asciidoctor-epub3 -r asciidoctor-diagram main.adoc

clean:
	@rm -rf main.html main.epub main.pdf
.PHONY: all pdf epub html clean
