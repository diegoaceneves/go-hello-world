FROM golang:1.19.0-alpine3.16 AS build
WORKDIR /app
COPY . /app
RUN go mod init main
RUN go mod tidy
RUN go build main.go

FROM alpine:3.16
LABEL maintainer Diego Neves <diego@diegoneves.eti.br>
LABEL description "Hello World"
COPY --from=build /app/main /app/main
EXPOSE 3000
WORKDIR /app
CMD ["./main"]
