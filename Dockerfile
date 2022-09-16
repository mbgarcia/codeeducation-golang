FROM golang:1.15-alpine as golang

WORKDIR /app

COPY *.go ./

RUN go run hello.go

RUN go build hello.go

FROM hello-world

WORKDIR /app

COPY --from=golang /app .

ENTRYPOINT ["./hello"]