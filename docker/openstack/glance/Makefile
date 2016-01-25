include ../../globals.mk

build:
	$(MAKE) -C glance-registry build
	$(MAKE) -C glance-api build

push:
	$(MAKE) -C glance-registry push
	$(MAKE) -C glance-api push

clean-all:
	$(MAKE) -C glance-registry clean-all
	$(MAKE) -C glance-api clean-all
