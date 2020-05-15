build-hello:
	docker build -f src/1/Dockerfile -t hello-debian .

run-hello: 
	docker run -p 8080:8080 hello

build-hello-alpine:
	docker build -f src/2/Dockerfile -t hello-alpine .

run-hello-alpine: 
	docker run -p 8080:8080 hello-alpine

build-hello-multi-stage:
	docker build -f src/3/Dockerfile -t hello-multi-stage .

run-hello-multi-stage: 
	docker run -p 8080:8080 hello-multi-stage

build-hello-ms-scratch:
	docker build -f src/4/Dockerfile -t hello-ms-scratch .

run-hello-ms-scratch: 
	docker run -p 8080:8080 hello-ms-scratch

build-all: build-hello build-hello-alpine build-hello-multi-stage build-hello-ms-scratch

list-images:
	docker images|grep hello-|sort -k7nr

remove-images:
	docker images|grep hello-|awk '{print $3}'|xargs docker rmi -f
