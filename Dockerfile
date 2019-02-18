FROM alpine:3.6

RUN apk update && apk add bash bind-tools curl \
        openssl grep diffutils sed coreutils gawk \
        && rm -rf /var/cache/apk

VOLUME /app
WORKDIR /app

CMD /bin/bash
