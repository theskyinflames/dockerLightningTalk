FROM golang:1.14.2-alpine AS builder
WORKDIR /root/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o mysrv

FROM scratch 
WORKDIR /root/
COPY --from=builder /root/mysrv .
EXPOSE 8080
CMD ["./mysrv"]  
