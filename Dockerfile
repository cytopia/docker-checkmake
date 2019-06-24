FROM golang:latest as builder

# Install dependencies
RUN set -x \
	&& DEBIAN_FRONTEND=noninteractive apt-get update -qq \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -qq -y --no-install-recommends --no-install-suggests \
		git \
		gox \
		pandoc \
	&& curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

# Get and build checkmake
ARG VERSION
RUN set -x \
	&& export GOPATH=/go \
	&& mkdir -p /go/src/github.com/mrtazz \
	&& git clone https://github.com/mrtazz/checkmake /go/src/github.com/mrtazz/checkmake \
	&& cd /go/src/github.com/mrtazz/checkmake \
	&& if [ ${VERSION} != "latest" ]; then \
		git checkout ${VERSION}; \
	fi \
	&& make \
	&& chmod +x checkmake

# Use a clean tiny image to store artifacts in
FROM alpine:latest
LABEL \
	maintainer="cytopia <cytopia@everythingcli.org>" \
	repo="https://github.com/cytopia/docker-checkmake"
COPY --from=builder /go/src/github.com/mrtazz/checkmake/checkmake /usr/bin/checkmake

WORKDIR /data
ENTRYPOINT ["checkmake"]
CMD ["--version"]
