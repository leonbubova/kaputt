FROM alpine:3.20
LABEL wg.track=docker
WORKDIR /app
COPY app.sh /app/app.sh
RUN mkdir -p /app/data
CMD ["sh", "/app/app.sh"]
