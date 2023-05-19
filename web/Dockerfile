# BUILD
# use the build platforms matching arch rather than target arch
FROM --platform=$BUILDPLATFORM golang:alpine as builder

ARG TARGETARCH

COPY dispatcher.go .
# build for the target arch not the build platform host arch
RUN GOOS=linux GOARCH=$TARGETARCH go build dispatcher.go

# RUN
# defaults to using the target arch image
FROM alpine

EXPOSE 80
CMD ["/dispatcher"]

COPY --from=builder /go/dispatcher /
COPY static /static/
