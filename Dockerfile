FROM alpine:3.7

RUN apk update && apk add bash bind-tools curl

VOLUME /app

CMD /bin/bash && cd /app
