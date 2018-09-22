## Minimal oauth2_proxy Docker Image (13MB, 4MB compressed)

Version v2.2 – built on [centurylink/ca-certs](https://github.com/CenturyLinkLabs/ca-certs-base-image).

## Install

As a prerequisite, you need [Docker](https://docker.com) to be installed.

To download this image from the public registry:

```shell
$ docker pull rjshrjndrn/oauth2-proxy
```

To re-build this image:

```shell
$ make build
```

## Configuration

`oauth2_proxy` can be configured via [config file](https://github.com/bitly/oauth2_proxy#config-file), [command line options](https://github.com/bitly/oauth2_proxy#command-line-options) or [environment variables](https://github.com/bitly/oauth2_proxy#environment-variables). See [`bitly/oauth2_proxy` documentation](https://github.com/bitly/oauth2_proxy) for more details.

## Usage

As standalone container:

```shell
$ docker run \
    -p 8080:4180 \
    -e OAUTH2_PROXY_CLIENT_ID="YOUR_CLIENT_ID" \
    -e OAUTH2_PROXY_CLIENT_SECRET="YOUR_CLIENT_SECRET" \
    -e OAUTH2_PROXY_COOKIE_SECRET="COOKIE_SECRET" \
    rjshrjndrn/oauth2-proxy:2.2 \
    -cookie-secure=false \
    -upstream=http://web:3000 \
    -redirect-url=http://127.0.0.1:8080 \
    -http-address=0.0.0.0:4180 \
    -email-domain=example.com
```

As `docker-compose` service:

```yml
version: '2'

services:
  web:
    image: web-image
    expose:
      - 3000

  proxy:
    image: rjshrjndrn/oauth2-proxy:2.2
    environment:
      OAUTH2_PROXY_CLIENT_ID: "YOUR_CLIENT_ID"
      OAUTH2_PROXY_CLIENT_SECRET: "YOUR_CLIENT_SECRET"
      OAUTH2_PROXY_COOKIE_SECRET: "COOKIE_SECRET"
    ports:
      - 8080:4180
    command: |
      -cookie-secure=false
      -upstream=http://web:3000
      -redirect-url=http://127.0.0.1:8080
      -http-address=0.0.0.0:4180
      -email-domain=example.com
```
