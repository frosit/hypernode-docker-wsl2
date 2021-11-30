#!make
include .env

build-container:
	docker build -t frosit/hypernode-docker-wsl:${CONTAINER_VERSION} .

pull-container:
	docker pull frosit/hypernode-docker-wsl:${CONTAINER_VERSION} .

tag-latest:
	docker image tag frosit/hypernode-docker-wsl:${CONTAINER_VERSION} frosit/hypernode-docker-wsl:latest

create:
	docker create --name hnwslv${CONTAINER_VERSION} frosit/hypernode-docker-wsl:${CONTAINER_VERSION} 

export:
	docker export hnwslv${CONTAINER_VERSION} -o hnwslv${CONTAINER_VERSION}.tar

# @todo permission issues
import:
	wsl.exe --import hypernode2 C:\WSL\hypernode C:\WSL\hnwslv0.0.4.tar

run:
	docker run -d --name hnwslv${CONTAINER_VERSION} frosit/hypernode-docker-wsl:${CONTAINER_VERSION}