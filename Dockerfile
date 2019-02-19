FROM alpine:3.6

RUN apk update && apk add bash bind-tools curl \
        openssl grep diffutils sed coreutils gawk \
        && rm -rf /var/cache/apk

VOLUME /data
WORKDIR /app
ADD config deploy.sh dehydrated gitlab-cert-renew.sh hook.sh /app/

CMD ./gitlab-cert-renew.sh
