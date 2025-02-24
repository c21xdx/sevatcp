FROM alpine:latest

ENV PORT 8080

COPY xapi /bin/

EXPOSE $PORT

CMD ["/bin/xapi"]
