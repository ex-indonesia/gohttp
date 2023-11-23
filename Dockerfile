FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o main .

# Path: /app/Dockerfile

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/main .
CMD ["./main"]
