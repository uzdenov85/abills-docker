# syntax=docker/dockerfile:1
FROM ubuntu
ARG ABILLS_PATH=/usr/abills
ARG CERTS_PATH=${ABILLS_PATH}/Certs
ARG APACHE_PATH=/etc/apache2
ARG OPENSSL=/usr/bin/openssl
WORKDIR /usr
COPY docker-entrypoint.sh /
RUN apt update && apt install -y libmysqlclient-dev apache2 apache2-utils libexpat1 ssl-cert cpanminus aptitude wget cron dialog \
    && wget https://sourceforge.net/projects/abills/files/abills/1.20/abills-1.20.00.tgz \
    && tar zxvf abills-1.20.00.tgz \
    && cp /usr/abills/libexec/config.pl.default /usr/abills/libexec/config.pl \
    && mkdir -p /var/log/httpd \
    && mkdir -p ${ABILLS_PATH}/var/log \
    && mkdir -p ${ABILLS_PATH}/backup \
    && touch ${ABILLS_PATH}/var/log/abills.log \
    && chown -Rf www-data:www-data ${ABILLS_PATH}/cgi-bin \
    && chown -Rf www-data:www-data ${ABILLS_PATH}/Abills/templates \
    && chown -Rf www-data:www-data ${ABILLS_PATH}/backup \
    && touch ${ABILLS_PATH}/var/log/sql_errors \
    && chown nobody ${ABILLS_PATH}/var/log/sql_errors \
    && chmod 666 ${ABILLS_PATH}/var/log/sql_errors \
    && cp ${ABILLS_PATH}/misc/apache/abills_httpd.conf ${APACHE_PATH}/sites-enabled/ \
    && . ${APACHE_PATH}/envvars \
    && ${OPENSSL} req -new -newkey "rsa:2048" -nodes -sha256 -out ${CERTS_PATH}/server.csr -keyout ${CERTS_PATH}/server.key -subj "/C=AZ/ST=Baku/L=city/O=Azintex ISP/OU=LLC/CN=billing.azintex.com" \
    && ${OPENSSL} x509 -req -days 730 -in ${CERTS_PATH}/server.csr -signkey ${CERTS_PATH}/server.key -out ${CERTS_PATH}/server.crt \
    && a2enmod ssl rewrite suexec include cgi headers \
    && cd ${ABILLS_PATH}/misc/ && perl perldeps.pl apt-get -batch \
    && cat /dev/null > /etc/crontab \
    && echo "*/5  *      *    *     *   root   /usr/abills/libexec/billd -all" > /etc/crontab \
    && echo "1     0     *    *     *   root    /usr/abills/libexec/periodic daily" >> /etc/crontab \
    && echo "1     1     *    *     *   root    /usr/abills/libexec/periodic monthly" >> /etc/crontab \
    && chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["service", "apache2", "start"]