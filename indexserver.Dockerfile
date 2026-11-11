FROM golang:1.24 AS builder
WORKDIR /app
COPY . .
RUN go build -o bin/indexserver ./cmd/indexserver

FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/bin/indexserver /indexserver

EXPOSE 9090
ENTRYPOINT ["/indexserver"]
