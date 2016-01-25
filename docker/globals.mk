DGIS_IMAGE_PREFIX=2gis
DGIS_DISTR=openstack-kilo

SHELL=/bin/bash

git_sha=$(shell git rev-parse --short HEAD)
ifdef CI_SERVER
	BUILD_TAG=latest
else
	BUILD_TAG=git-$(git_sha)
endif
