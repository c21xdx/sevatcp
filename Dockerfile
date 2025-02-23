FROM alpine:latest

ENV PORT 8080

USER root

RUN echo "Starting Dockerfile execution" \
    && apk upgrade --update \
    && echo "apk upgrade completed" \
    && apk add --no-cache bash curl \
    && echo "bash and curl installed" \
    # Install api
    && mkdir /app \
    && echo "Created /app directory" \
    && curl -L -H "Cache-Control: no-cache" -o /app/api https://github.com/c21xdx/free/releases/download/250221/api \
    && if [ $? -ne 0 ]; then \
        echo "Error: Failed to download /app/api" && exit 1; \
    fi \
    && echo "/app/api download completed" \
    && ls -l /app \
    && chmod +x /app/* \
    && echo "chmod +x /app/* completed" \
    && ls -l /app \
    && apk del curl && rm -rf /var/cache/apk/* \
    && echo "Cleanup completed"

EXPOSE $PORT

CMD ["/app/api"]
