NAME		:= todo-backend
TAG			:= $$(echo $$(git describe --dirty --abbrev=7 --tags --always --first-parent --long))
BASENAME	:= ${NAME}
IMG			:= ${BASENAME}:${TAG}
EXPERIMENTAL:= ${BASENAME}:experimental
LATEST		:= ${BASENAME}:latest

.PHONY: check-uncommitted all

check-uncommitted:
    ifneq ($(shell echo `git status -s`),)
		$(error Please commit files before building.)
    endif

build-no-check:
	docker build --build-arg tag=${TAG} -t ${IMG} .

build: check-uncommitted build-no-check

push:
	docker push ${IMG}

push-as-latest:
	docker pull ${IMG}
	docker tag ${IMG} ${LATEST}
	docker push ${LATEST}

all: build push push-as-latest

experimental:
	docker build --build-arg tag=${TAG} -t ${EXPERIMENTAL} .
	docker push ${EXPERIMENTAL}

login:
	docker login

test-tag:
	echo ${TAG}
