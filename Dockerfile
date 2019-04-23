FROM openjdk:8-jre-alpine

ENV ARCHIVA_VERSION="2.2.3"

RUN wget http://apache.40b.nl/archiva/${ARCHIVA_VERSION}/binaries/apache-archiva-${ARCHIVA_VERSION}-bin.tar.gz \
  && tar xzf apache-archiva-${ARCHIVA_VERSION}-bin.tar.gz \
  && rm -rf apache-archiva-${ARCHIVA_VERSION}-bin.tar.gz \
  && mv apache-archiva-${ARCHIVA_VERSION} archiva \
  && mkdir -p /archiva-data \
  && mv /archiva/conf /archiva/conf.backup \
  && ln -s /archiva-data/conf /archiva/conf \
  && ln -s /archiva-data/repositories /archiva/repositories \
  && apk add --update -t deps libc6-compat \
  && rm /var/cache/apk/*
 
ADD entrypoint.sh /

EXPOSE 8080/tcp

VOLUME /archiva-data

ENTRYPOINT ["/entrypoint.sh"]
