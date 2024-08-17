APP_NAME=$(shell basename $(shell git remote get-url origin))
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
DOCKER_REGISTRY=9529

format:
	gofmt -s -W ./
	
lint:
	golint

test:
	go test -v

linux:
    GOOS=linux GOARCH=amd64 go build -o ${APP_NAME}-linux-${VERSION}

arm:
    GOOS=linux GOARCH=arm64 go build -o ${APP_NAME}-arm-${VERSION}

macos:
    GOOS=darwin GOARCH=amd64 go build -o ${APP_NAME}-macos-${VERSION}

windows:
    GOOS=windows GOARCH=amd64 go build -o ${APP_NAME}-windows-${VERSION}.exe

clean:
	rm -rf ${APP_NAME}
    docker rmi ${DOCKER_REGISTRY}/${APP_NAME}:${VERSION}