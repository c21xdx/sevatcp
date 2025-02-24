FROM alpine:latest

ENV PORT 8080

# 安装 glibc
RUN apk update && apk add --no-cache \
        bash \
        curl \
    && curl -Lo /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && curl -Lo glibc.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk \
    && apk add --no-cache glibc.apk \
    && rm -f glibc.apk

# 复制本地的二进制文件到 /bin 目录，并赋予执行权限
COPY xapi /bin/xapi
RUN chmod +x /bin/xapi

# 暴露端口
EXPOSE $PORT

# 设置启动命令
CMD ["/bin/xapi"]
