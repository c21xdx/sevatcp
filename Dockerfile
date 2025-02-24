FROM ubuntu:22.04

ENV PORT 8080

# 安装必要的软件包
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 复制本地的二进制文件到 /usr/local/bin 目录，并赋予执行权限
COPY xapi /usr/local/bin/xapi
RUN chmod +x /usr/local/bin/xapi

# 暴露端口
EXPOSE $PORT

# 设置启动命令
CMD ["/usr/local/bin/xapi"]
