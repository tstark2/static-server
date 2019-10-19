FROM alpine:latest

RUN apk update

COPY static-server static-server

ENTRYPOINT [ "./static-server" ]