include ../../globals.mk

build:
	$(MAKE) -C ubuntu build-pull
	$(MAKE) -C apache2 build

push:
	$(MAKE) -C ubuntu push
	$(MAKE) -C apache2 push

clean-all:
	$(MAKE) -C ubuntu clean-all
	$(MAKE) -C apache2 clean-all
