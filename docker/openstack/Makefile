include ../globals.mk

build-%:
	$(MAKE) -C $$(echo $@ | cut -c 7-) build

parallel-build: \
	build-keystone \
	build-horizon \
	build-cinder \
	build-designate \
	build-glance \
	build-heat \
	build-libvirt \
	build-nova \
	build-neutron \
	build-rally \
	build-tempest

build:
	$(MAKE) -C base build
	$(MAKE) parallel-build

push:
	$(MAKE) -C base push
	$(MAKE) -C keystone push
	$(MAKE) -C horizon push
	$(MAKE) -C cinder push
	$(MAKE) -C designate push
	$(MAKE) -C glance push
	$(MAKE) -C heat push
	$(MAKE) -C libvirt push
	$(MAKE) -C nova push
	$(MAKE) -C neutron push
	$(MAKE) -C rally push
	$(MAKE) -C tempest push

clean-all:
	$(MAKE) -C base clean-all
	$(MAKE) -C keystone clean-all
	$(MAKE) -C horizon clean-all
	$(MAKE) -C cinder clean-all
	$(MAKE) -C designate clean-all
	$(MAKE) -C glance clean-all
	$(MAKE) -C heat clean-all
	$(MAKE) -C nova clean-all
	$(MAKE) -C neutron clean-all
	$(MAKE) -C tempest clean-all
	$(MAKE) -C rally clean-all
	$(MAKE) -C libvirt clean-all
