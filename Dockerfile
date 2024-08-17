FROM quay.io/projectquay/golang:1.20

WORKDIR /app

COPY . .

RUN go get

RUN GOOS=$(TARGETOS) GOARCH=$(TARGETARCH) go build -o $(APP_NAME)

