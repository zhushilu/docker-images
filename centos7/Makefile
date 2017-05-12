all: build push
.PHONY: build push 

TAG = 7.2.1511

DOCKER_REGISTRY = index.tenxcloud.com/jimmy

build:
	docker build -t $(DOCKER_REGISTRY)/centos:$(TAG) .

push: 
	docker push $(DOCKER_REGISTRY)/centos:$(TAG)

clean:
	docker rmi $(DOCKER_REGISTRY)/centos:$(TAG)
