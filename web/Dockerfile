# BUILD
# use the build platforms matching arch rather than target arch
FROM --platform=$BUILDPLATFORM golang:alpine as builder
WORKDIR /usr/local/app
ARG TARGETARCH

COPY dispatcher.go .

# build for the target arch not the build platform host arch
RUN GOOS=linux GOARCH=$TARGETARCH go build dispatcher.go

# RUN
# defaults to using the target arch image
FROM alpine:latest
WORKDIR /usr/local/app

COPY --from=builder /usr/local/app/dispatcher ./
COPY static ./static/

EXPOSE 80
CMD ["/usr/local/app/dispatcher"]
