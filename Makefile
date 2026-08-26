# Résumé build system. Compiles applications/ × templates/ to out/*.pdf inside a
# pinned TeX Live Docker image (LuaLaTeX). See README.md.
#
# Recipe lines are TAB-indented (portable back to macOS's make 3.81).

IMAGE    := resume-build
APP      ?= acme-senior-swe
TEMPLATE ?= classic
OUT      := out
UID      := $(shell id -u)
GID      := $(shell id -g)

# Run a command in the pinned image, repo mounted at /work, as the host user so
# generated files are owned by you (not root). HOME/TEXMFVAR give a writable cache.
DOCKER = docker run --rm \
           --user "$(UID):$(GID)" \
           -e HOME=/tmp -e TEXMFVAR=/tmp/texmf-var \
           -v "$(CURDIR)":/work -w /work $(IMAGE)

.PHONY: help build all image list clean

help:
	@echo "make build APP=<app> TEMPLATE=<tpl>   # one résumé  -> $(OUT)/<app>--<tpl>.pdf"
	@echo "make all                              # every application × every template"
	@echo "make list                             # available applications and templates"
	@echo "make clean                            # rm -rf $(OUT)  (instant artifact wipe)"
	@echo ""
	@echo "Defaults: APP=$(APP) TEMPLATE=$(TEMPLATE)"

image:
	docker build -t $(IMAGE) .

build: image
	$(DOCKER) sh scripts/build.sh $(APP) $(TEMPLATE)

all: image
	$(DOCKER) sh scripts/build-all.sh

list:
	@echo "Applications:"; ls applications/*.tex | xargs -n1 basename | sed 's/\.tex$$//;s/^/  /'
	@echo "Templates:";    ls templates/*.cls   | xargs -n1 basename | sed 's/\.cls$$//;s/^/  /'

clean:
	rm -rf $(OUT)
