FROM alpine:3.8

MAINTAINER andre@jeanmaire.nl

# User data directory, contains flows, config and nodes.
RUN mkdir /data

RUN apk update
RUN apk add openssl python2 py-pip nodejs nodejs-npm

RUN pip install pyro

RUN mkdir /opc
COPY opc/* /opc/

RUN npm install -g --unsafe-perm node-red
RUN cd /data
RUN npm install node-red-contrib-opcua

VOLUME ["/data"]
#EXPOSE 1880

ENTRYPOINT node-red --userDir /data
