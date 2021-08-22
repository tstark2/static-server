FROM alpine:latest

COPY static-server-spa static-server-spa

ENTRYPOINT [ "./static-server-spa" ]