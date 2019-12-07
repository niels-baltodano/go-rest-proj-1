FROM golang:1.13-buster as build

RUN curl https://glide.sh/get | sh

ENV PKG_NAME=github.com/niels581/go-rest-proj-1
ENV PKG_PATH=$GOPATH/src/$PKG_NAME
WORKDIR $PKG_PATH

COPY glide.yaml glide.lock $PKG_PATH/
RUN glide install

COPY . $PKG_PATH
RUN go build -o /go/bin/app && go install

# WORKDIR $PKG_PATH
# EXPOSE 8000
# CMD ["go-rest-proj-1"]
FROM gcr.io/distroless/base
COPY --from=build /go/bin/app /
CMD ["/app"]
