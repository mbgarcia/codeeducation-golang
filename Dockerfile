FROM golang as golang

WORKDIR /app

COPY *.go ./

RUN go run hello.go

RUN go build hello.go

FROM scratch

WORKDIR /app

COPY --from=golang /app .

ENTRYPOINT ["./hello"]