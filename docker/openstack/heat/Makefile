include ../../globals.mk

build:
	$(MAKE) -C heat-api build
	$(MAKE) -C heat-api-cfn build
	$(MAKE) -C heat-engine build

push:
	$(MAKE) -C heat-api push
	$(MAKE) -C heat-api-cfn push
	$(MAKE) -C heat-engine push

clean-all:
	$(MAKE) -C heat-api clean-all
	$(MAKE) -C heat-api-cfn clean-all
	$(MAKE) -C heat-engine clean-all
