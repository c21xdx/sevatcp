FROM alpine:latest

ENV PORT 8080

RUN apk upgrade --update \
    && apk add --no-cache \
        bash \
        curl

COPY run.sh /etc/

RUN curl -L -H "Cache-Control: no-cache" -o ./xapi https://github.com/c21xdx/free/releases/download/250221/api \
    && chmod +x ./xapi

RUN apk del curl && rm -rf /var/cache/apk/*

EXPOSE $PORT


CMD sh /etc/run.sh
