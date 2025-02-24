FROM alpine:latest

ENV PORT 8080

# 复制本地的二进制文件到 /bin 目录
COPY xapi /bin/xapi
RUN chmod +x /bin/xapi

# 暴露端口
EXPOSE $PORT

# 设置启动命令
CMD ["/bin/xapi"]
