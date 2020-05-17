build-hello:
	echo "\nBulding with Debian Linux base image..."
	docker build -f dockerfiles/1/Dockerfile -t hello-1-debian .

run-hello: 
	docker run -p 8080:8080 hello-1-debian

build-hello-alpine:
	echo "\nBuilding with Alpine Linux base image..."
	docker build -f dockerfiles/2/Dockerfile -t hello-2-alpine .

run-hello-alpine: 
	docker run -p 8080:8080 hello-2-alpine

build-hello-multi-stage:
	echo "\nBuilding with Alpine Linux using multi stage compilation..."
	docker build -f dockerfiles/3/Dockerfile -t hello-3-multi-stage .

run-hello-multi-stage: 
	docker run -p 8080:8080 hello-3-multi-stage

build-hello-ms-scratch:
	echo "\nBuilding with multi stage compilation, and the scratch image...."
	docker build -f dockerfiles/4/Dockerfile -t hello-4-ms-scratch .

run-hello-ms-scratch: 
	docker run -p 8080:8080 hello-4-ms-scratch

build-all: build-hello build-hello-alpine build-hello-multi-stage build-hello-ms-scratch

list-images:
	docker images|grep hello-|sort -k1nr

remove-images:
	docker images|grep hello-|awk '{print $3}'|xargs docker rmi -f
