FROM node:alpine

EXPOSE 4090

WORKDIR /home/choreouser

COPY .. /home/choreouser/

RUN apk update &&\
    apk add --no-cache netcat &&\
    apk add iproute2 vim netcat-openbsd curl openssl coreutils &&\
    addgroup --gid 10001 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10001 --ingroup choreo choreouser &&\
    addgroup choreouser &&\
    chmod +x start.sh npm assistant bot &&\
    tnc region1.v2.argotunnel.com -port 7844

CMD [ "ash", "start.sh" ]

USER 10001
