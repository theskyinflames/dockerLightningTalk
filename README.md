# dockerLightningTalk
A brew lightning talk about how to reduce Docker images. 
The goal is to explain how can we decrease the size of our Docker images and why it's important.

## Start the presentation:
This presentation uses the [present tool](https://godoc.org/golang.org/x/tools/present) from Go. You to install it and do:
```sh
  dockerLightningTalk git:(master) ✗ present
  2020/05/17 21:43:07 Open your web browser and visit http://127.0.0.1:3999
```

## Approach 
I've take a minimal service in golang and put it in a docker image: 
```go
import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", HelloServer)
	fmt.Println("server started on :8080")
	http.ListenAndServe(":8080", nil)
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello world!\n"))
}
```

From here, I build four docker images based on its own docker files. All images does the same, dockerizing the above service. 
But all Dockerfiles are different:
* First Dockerfile uses a Debian Linux with Golang as base image.
* Second Dockerfile uses an Alpine Linux as base image.
* Third Dockerfile uses multi stage building. This dereases dramatically the size of the docker image-
* Fourth Dockerfile combines multi stage building and *scratch* image usage.

This is the result:
```sh
  docker images|grep hello-|sort -k1nr
  hello-1-debian        latest              a57e328870c3        27 minutes ago      818MB
  hello-2-alpine        latest              91b9333cc751        27 minutes ago      378MB
  hello-3-multi-stage   latest              151363ae52cd        27 minutes ago      13.1MB
  hello-4-ms-scratch    latest              d1ea8ed7079f        26 minutes ago      7.41MB
```
## Check it out for yourself
1. Compile the Dockerfiles
```sh
  make build-all
```
2. List Docker images and compare its sizes
```sh
  make list-imgages
```
