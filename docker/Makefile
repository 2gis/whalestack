include globals.mk

build-%:
	$(MAKE) -C $$(echo $@ | cut -c 7-) build

build: \
	build-infrastructure \
	build-openstack

clean-all:
	$(MAKE) -C infrastructure clean-all
	$(MAKE) -C openstack clean-all

push:
	$(MAKE) -C infrastructure push
	$(MAKE) -C openstack push

dump-confd-config-keys:
	@-find . -iname '*.tmpl' | xargs grep '/services/.*/config' | sed 's/^.*"\(\/services\/.*\/config\/.*\)".*$$/\1/' | sort | uniq
