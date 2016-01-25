include ../globals.mk

pull-%:
	$(MAKE) -C $$(echo $@ | cut -c 6-) pull

build-pull-%:
	$(MAKE) -C $$(echo $@ | cut -c 12-) build-pull

build: \
	pull-registrator \
	build-pull-router

clean-all:
	$(MAKE) -C registrator clean-all
	$(MAKE) -C router clean-all

push:
	$(MAKE) -C registrator push
	$(MAKE) -C router push
