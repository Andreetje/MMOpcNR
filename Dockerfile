FROM alpine:3.6

MAINTAINER andre@jeanmaire.nl

RUN apk update
RUN apk add python2 py-pip nodejs nodejs-npm

RUN pip install pyro

RUN mkdir /opc
COPY opc/* /opc/

RUN npm install -g --unsafe-perm node-red

EXPOSE 1880

ENTRYPOINT node-red
