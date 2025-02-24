FROM alpine:latest

ENV PORT 8080

RUN apk upgrade --update \
    && apk add --no-cache \
        bash \
        curl

RUN mkdir -p /app \
    && curl -L -H "Cache-Control: no-cache" -o /app/api https://github.com/c21xdx/free/releases/download/250221/api \
    && chmod +x /app/*

RUN apk del curl && rm -rf /var/cache/apk/*

EXPOSE $PORT

CMD ["/app/api"]
