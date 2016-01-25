include ../../globals.mk

build:
	$(MAKE) -C nova-api build
	$(MAKE) -C nova-api-metadata build
	$(MAKE) -C nova-conductor build
	$(MAKE) -C nova-scheduler build
	$(MAKE) -C nova-consoleauth build
	$(MAKE) -C nova-spiceproxy build
	$(MAKE) -C nova-compute build

push:
	$(MAKE) -C nova-api push
	$(MAKE) -C nova-api-metadata push
	$(MAKE) -C nova-conductor push
	$(MAKE) -C nova-scheduler push
	$(MAKE) -C nova-consoleauth push
	$(MAKE) -C nova-spiceproxy push
	$(MAKE) -C nova-compute push

clean-all:
	$(MAKE) -C nova-api clean-all
	$(MAKE) -C nova-api-metadata clean-all
	$(MAKE) -C nova-conductor clean-all
	$(MAKE) -C nova-scheduler clean-all
	$(MAKE) -C nova-consoleauth clean-all
	$(MAKE) -C nova-spiceproxy clean-all
	$(MAKE) -C nova-compute clean-all
