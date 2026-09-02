FROM alpine:3.20
LABEL wg.track=docker
WORKDIR /opt/tool
COPY entrypiont.sh /opt/tool/entrypoint.sh
RUN chmod +x /opt/tool/entrypoint.sh
ENTRYPOINT ["/opt/tool/entrypoint.sh"]
