include ../../globals.mk

build:
	$(MAKE) -C designate-central build
	$(MAKE) -C designate-api build

start:
	$(MAKE) -C designate-central start
	$(MAKE) -C designate-api start

stop:
	$(MAKE) -C designate-central stop
	$(MAKE) -C designate-api stop

push:
	$(MAKE) -C designate-central push
	$(MAKE) -C designate-api push

clean-all:
	$(MAKE) -C designate-central clean-all
	$(MAKE) -C designate-api clean-all

deploy:
	$(MAKE) -C designate-central deploy
	$(MAKE) -C designate-api deploy

dev-env:
		$(MAKE) -C designate-central dev-env
		$(MAKE) -C designate-api dev-env
