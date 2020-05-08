FROM golang:1.14.2-buster
WORKDIR /root/
COPY . .
RUN go build -o mysrv
EXPOSE 8080
CMD [ "./mysrv" ]