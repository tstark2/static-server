FROM golang:alpine
COPY . /static-server
WORKDIR /static-server
RUN go build -o static-server-spa

FROM alpine:latest
COPY --from=0 /static-server/static-server-spa static-server-spa
ENTRYPOINT [ "./static-server-spa" ]