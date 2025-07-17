FROM alpine:3.20

RUN apk add --no-cache bash tar

WORKDIR /app
COPY backup.sh .

ENTRYPOINT ["./backup.sh"]
