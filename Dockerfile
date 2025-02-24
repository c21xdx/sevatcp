FROM alpine:latest

ENV PORT 8080

USER root

RUN apk upgrade --update \
    && apk add --no-cache \
        bash \
        curl

RUN curl -L -H "Cache-Control: no-cache" -o /bin/xapi https://github.com/c21xdx/free/releases/download/250221/api \
    && chmod +x /bin/xapi

RUN apk del curl && rm -rf /var/cache/apk/*

EXPOSE $PORT

WORKDIR /bin/

CMD ["/bin/xapi"]
