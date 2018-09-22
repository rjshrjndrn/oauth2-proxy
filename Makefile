VERSION = 2.2
FILE = oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz
IMAGE = rjshrjndrn/oauth2-proxy                     

all: build publish

build:
	mkdir -p dist
	curl -L -o dist/${FILE} https://github.com/bitly/oauth2_proxy/releases/download/v${VERSION}/${FILE}
	tar -xf dist/${FILE} --strip-components 1 -C dist
	docker build -t ${IMAGE}:${VERSION} -t ${IMAGE}:latest --no-cache .

publish:
	docker push ${IMAGE}
