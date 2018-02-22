FROM golang:1.8

MAINTAINER seanmcguigan@gmx.com

COPY app-code/http-sample /app/http-sample

#USER bitnami

WORKDIR /app

EXPOSE 3000

ENTRYPOINT ["/app/http-sample"]
