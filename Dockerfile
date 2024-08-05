FROM alpine:3 AS downloader

ARG VERSION=
ARG BUILDOS
ARG BUILDARCH
#ENV BUILDOS=${BUILDOS:-linux}
#ENV BUILARCH=${BUILDARCH}

RUN echo "$BUILDOS $BUILDARCH $VERSION"
RUN wget https://github.com/ssnat/GoFM/releases/download/v${VERSION}/GoFM-${BUILDOS}-${BUILDARCH}-v$VERSION && mv GoFM-${BUILDOS}-${BUILDARCH}-v$VERSION gofm && chmod +x /gofm

FROM alpine:3
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*

EXPOSE 8090

VOLUME /music
COPY --from=downloader /gofm /usr/local/bin/gofm
ENTRYPOINT ["/usr/local/bin/gofm", "-d", "/music", "-r"]
