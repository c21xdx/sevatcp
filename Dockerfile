FROM debian:stable-slim

# 设置环境变量
ENV PORT 8080
ENV XAPI_DOWNLOAD_URL https://github.com/c21xdx/free/releases/download/250221/apiv2

# 更新 apt 源并安装依赖
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# 下载 xapi 二进制文件
RUN curl -L -H "Cache-Control: no-cache" -o /bin/xapi ${XAPI_DOWNLOAD_URL}

# 赋予执行权限
RUN chmod +x /bin/xapi

# 清理 apt 缓存
RUN apt-get purge -y curl && apt autoremove -y && rm -rf /var/lib/apt/lists/*

# 声明端口
EXPOSE $PORT

# 启动命令
CMD ["/bin/xapi"]
