FROM golang:1.8

MAINTAINER seanmcguigan@gmx.com

RUN mkdir /app

COPY app-code /app

RUN ls -l /app/

WORKDIR /app

RUN go build -tags netgo -o http-sample

EXPOSE 3000

ENTRYPOINT ["/app/http-sample"]