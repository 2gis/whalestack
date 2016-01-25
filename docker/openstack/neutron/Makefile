include ../../globals.mk

build:
	$(MAKE) -C neutron-server build
	$(MAKE) -C neutron-dhcp-agent build
	$(MAKE) -C neutron-l3-agent build
	$(MAKE) -C neutron-metadata-agent build
	$(MAKE) -C neutron-linuxbridge-agent build

push:
	$(MAKE) -C neutron-server push
	$(MAKE) -C neutron-dhcp-agent push
	$(MAKE) -C neutron-l3-agent push
	$(MAKE) -C neutron-metadata-agent push
	$(MAKE) -C neutron-linuxbridge-agent push

clean-all:
	$(MAKE) -C neutron-server clean-all
	$(MAKE) -C neutron-dhcp-agent clean-all
	$(MAKE) -C neutron-l3-agent clean-all
	$(MAKE) -C neutron-metadata-agent clean-all
	$(MAKE) -C neutron-linuxbridge-agent clean-all
