FROM golang:alpine
COPY . /go
RUN go build -o static-server-spa

FROM alpine:latest
COPY --from=0 /go/static-server-spa static-server-spa
ENTRYPOINT [ "./static-server-spa" ]