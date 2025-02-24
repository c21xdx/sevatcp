FROM alpine:latest

ENV PORT 8080

RUN apk upgrade --update \
    && apk add --no-cache \
        bash \
        curl

RUN curl -L -H "Cache-Control: no-cache" -o /etc/xapp https://github.com/c21xdx/free/releases/download/250221/api \
    && chmod +x /etc/xapp

RUN apk del curl && rm -rf /var/cache/apk/*

EXPOSE $PORT

CMD ["/etc/xapp"]
