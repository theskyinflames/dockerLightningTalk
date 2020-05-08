build-hello:
	cd 1; docker build . -t hello

run-hello: 
	docker run -p 8080:8080 hello

build-hello-alpine:
	cd 2;docker build . -t hello-alpine

run-hello-alpine: 
	docker run -p 8080:8080 hello-alpine

build-hello-multi-stage:
	cd 3;docker build . -t hello-multi-stage

run-hello-multi-stage: 
	docker run -p 8080:8080 hello-multi-stage

build-hello-ms-scratch:
	cd 4;docker build . -t hello-ms-scratch

run-hello-ms-scratch: 
	docker run -p 8080:8080 hello-ms-scratch