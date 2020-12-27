VERSION := $(shell  sh -c 'cat VERSION')

IMAGENAME=fluentd-hec
REPO=ihuntenator
IMAGEFULLNAME=${REPO}/${IMAGENAME}:${VERSION}

clean:
	@rm -rf docker/fluentd.conf

build: clean 
	@curl https://raw.githubusercontent.com/ihuntenator/fluentd-conf/master/fluentd.conf -o docker/fluentd.conf
	@docker build --no-cache --pull --build-arg VERSION=$(VERSION) -t ${IMAGEFULLNAME} ./docker

push:
	@docker push ${IMAGEFULLNAME}

all: build push
