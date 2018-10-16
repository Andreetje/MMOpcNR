FROM alpine:3.8
MAINTAINER andre@jeanmaire.nl

# User data directory, contains flows, config and nodes.
RUN mkdir /data

RUN apk update
RUN apk add openssl python2 py-pip nodejs nodejs-npm

RUN pip install pyro
RUN pip install --upgrade pip

RUN mkdir /opc
COPY opc/* /opc/

RUN npm install -g --unsafe-perm node-red

VOLUME ["/data"]
#EXPOSE 1880 

ENTRYPOINT node-red --userDir /data
