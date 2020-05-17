FROM golang:1.14.2-alpine3.11
WORKDIR /root/
COPY . .
RUN go build -o mysrv

FROM alpine:3.11
WORKDIR /root/
COPY --from=0 /root/mysrv .
EXPOSE 8080
CMD ["./mysrv"]  
