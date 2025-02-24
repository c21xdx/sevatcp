FROM alpine:latest

ENV PORT 8080

RUN apk upgrade --update \
    && apk add --no-cache curl

RUN curl -L -H "Cache-Control: no-cache" -o /bin/xapi https://github.com/c21xdx/free/releases/download/250221/apiv2 \
    && chmod +x /bin/xapi

RUN apk del curl && rm -rf /var/cache/apk/*

EXPOSE $PORT

CMD ["/bin/xapi"]
