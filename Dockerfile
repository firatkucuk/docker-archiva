FROM openjdk:8-jre-alpine

ENV ARCHIVA_VERSION="2.2.3"

RUN wget http://apache.40b.nl/archiva/${ARCHIVA_VERSION}/binaries/apache-archiva-${ARCHIVA_VERSION}-bin.tar.gz \
 && tar xzf apache-archiva-${ARCHIVA_VERSION}-bin.tar.gz \
 && rm -rf apache-archiva-${ARCHIVA_VERSION}-bin.tar.gz \
 && mv apache-archiva-${ARCHIVA_VERSION} archiva \
 && apk add --update -t deps libc6-compat \
 && rm /var/cache/apk/*
 
EXPOSE 8080/tcp

VOLUME /archiva/repositories

ENTRYPOINT ["/archiva/bin/archiva", "console"]