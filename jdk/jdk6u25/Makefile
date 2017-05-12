all: build push
.PHONY: build push 

TAG = 6u26

DOCKER_REGISTRY = index.tenxcloud.com/jimmy

build:
	docker build -t $(DOCKER_REGISTRY)/jdk:$(TAG) .

push: 
	docker push $(DOCKER_REGISTRY)/jdk:$(TAG)

clean:
	docker rmi $(DOCKER_REGISTRY)/jdk:$(TAG)
