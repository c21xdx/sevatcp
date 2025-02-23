FROM alpine:latest

ENV PORT 8080

RUN apk upgrade --update \
    && apk add \
        bash \
        curl \
    # Install api
    && mkdir /app \
    && curl -L -H "Cache-Control: no-cache" -o /app/api https://github.com/c21xdx/free/releases/download/250221/api \
    && chmod +x /app/* \
    # clear
    && apk del curl && rm -rf /var/cache/apk/*
    
EXPOSE $PORT
    
CMD ./api
