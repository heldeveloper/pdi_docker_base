FROM  openjdk:8-jre-slim-buster

LABEL maintainer="heliezer.goncalves@healthbit.com.br" \
    pdi=PDI \
    version=9.1


WORKDIR /
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]