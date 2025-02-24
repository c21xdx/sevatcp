FROM alpine:latest

ENV PORT 8080
ENV GOLANG_VERSION 1.23.6
ENV ZIP_URL=https://github.com/c21xdx/free/releases/download/250221/xapi.zip

# 安装必要的软件包
RUN apk update && apk add --no-cache \
        bash \
        curl \
        gcc \
        go \
        musl-dev \
        unzip

# 下载并解压 golang 源码 zip 文件
RUN curl -L -o /tmp/xapi.zip $ZIP_URL \
    && mkdir -p /tmp/xapi \
    && unzip /tmp/xapi.zip -d /tmp/xapi \
    && cd /tmp/xapi/250221 \
    && go build -o /bin/xapi -trimpath -ldflags "-s -w -buildid=" ./main \
    && chmod +x /bin/xapi

# 清理临时文件和不必要的软件包
RUN apk del gcc go musl-dev unzip \
    && rm -rf /var/cache/apk/* /tmp/xapi /tmp/xapi.zip

# 暴露端口
EXPOSE $PORT

# 设置启动命令
CMD ["/bin/xapi"]
