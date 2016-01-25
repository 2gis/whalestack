include ../../globals.mk

build:
	$(MAKE) -C cinder-api build
	$(MAKE) -C cinder-volume build
	$(MAKE) -C cinder-scheduler build

push:
	$(MAKE) -C cinder-api push
	$(MAKE) -C cinder-volume push
	$(MAKE) -C cinder-scheduler push

clean-all:
	$(MAKE) -C cinder-api clean-all
	$(MAKE) -C cinder-volume clean-all
	$(MAKE) -C cinder-scheduler clean-all
