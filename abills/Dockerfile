# syntax=docker/dockerfile:1
FROM ubuntu
WORKDIR /usr
COPY docker-entrypoint.sh /
RUN apt update && apt install -y libmysqlclient-dev apache2 apache2-utils libexpat1 ssl-cert cpanminus aptitude wget \
    && wget https://sourceforge.net/projects/abills/files/abills/1.20/abills-1.20.00.tgz \
    && tar zxvf abills-1.20.00.tgz \
